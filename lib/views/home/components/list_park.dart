import 'package:flutter/material.dart';
import 'package:parking_u/main.dart';
import 'package:sizer/sizer.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';
import 'package:parking_u/models/parkir_model.dart';
import 'package:parking_u/services/parkir_service.dart';
import 'package:parking_u/views/home/components/detail_book.dart';

class ListPark extends StatefulWidget {
  final ParkirModel item;

  const ListPark({Key key, this.item}) : super(key: key);

  @override
  _ListParkState createState() => _ListParkState();
}

class _ListParkState extends State<ListPark> {
  bool loading = false;
  TextEditingController editingController = TextEditingController();

  void fetchParkirList() async {
    try {
      await ParkirService.getAllParkir().then((value) {
        if (value is List<ParkirModel>) {
          print('Success');
          setState(() {
            listParkir.clear();
            listParkir.addAll(value);
            loading = false;
          });
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    fetchParkirList();
    loading = true;
  }

  void fetchSearchParkirList(searchKeyword) async {
    if (searchKeyword.isNotEmpty) {
      try {
        await ParkirService.getSearchParkir(searchKeyword).then((value) {
          if (value is List<ParkirModel>) {
            print('Success');
            setState(() {
              listParkir.clear();
              listParkir.addAll(value);
              loading = false;
            });
          }
        });
      } catch (e) {
        print(e.toString());
      }
    } else {
      try {
        await ParkirService.getAllParkir().then((value) {
          if (value is List<ParkirModel>) {
            print('Success');
            setState(() {
              listParkir.clear();
              listParkir.addAll(value);
              loading = false;
            });
          }
        });
      } catch (e) {
        print(e.toString());
      }
    }
  }

  Future<void> fetchRefreshParkirList() async {
    try {
      await ParkirService.getAllParkir().then((value) {
        if (value is List<ParkirModel>) {
          print('Success');
          setState(() {
            listParkir.clear();
            listParkir.addAll(value);
            loading = false;
          });
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20),
              bottom: getProportionateScreenWidth(20),
            ),
            child: TextField(
              onChanged: (value) {
                fetchSearchParkirList(value.capitalizeFirstofEach);
                print(value.capitalizeFirstofEach);
              },
              textCapitalization: TextCapitalization.words,
              controller: editingController,
              style: TextStyle(fontSize: caption.sp, color: secondaryTextColor),
              cursorColor: secondaryTextColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10),
                  vertical: getProportionateScreenWidth(12),
                ),
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(color: primaryColor, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                ),
                hintText: "Cari lokasi",
                prefixIcon: Icon(
                  Icons.search,
                  color: secondaryTextColor,
                  size: 6.0.w,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 59.0.h,
            child: loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: fetchRefreshParkirList,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: listParkir.length,
                      itemBuilder: (context, index) {
                        ParkirModel item = listParkir[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.0.w,
                            vertical: 4.0.w,
                          ),
                          child: ListParkHere(
                            image: item.linkImage,
                            name: item.namaParkir,
                            price: item.harga,
                            length: item.jarak,
                            availability: item.statusLahan,
                            rating: item.rating,
                            times: item.jam,
                            press: () => displayBottomSheet(context, item),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

extension CapExtension on String {
  String get inCaps =>
      this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");
}

class ListParkHere extends StatelessWidget {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  const ListParkHere({
    Key key,
    @required this.name,
    @required this.image,
    @required this.length,
    @required this.press,
    @required this.price,
    @required this.availability,
    @required this.rating,
    @required this.times,
  }) : super(key: key);

  final String name, image, availability, times;
  final int length, price, rating;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(defaultPadding),
      ),
      child: GestureDetector(
        onTap: press,
        child: Container(
          height: getProportionateScreenHeight(defaultPadding + 150),
          decoration: BoxDecoration(
            color: primaryBackgroundColor,
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.1.w,
                blurRadius: 1.0.w,
                offset: Offset(0, 0.2.h),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Stack(
              children: [
                Positioned(
                  left: 0.0.w,
                  top: 0.0.h,
                  bottom: 0.0.h,
                  right: 55.0.w,
                  child: ClipRRect(
                    borderRadius: borderRadius,
                    child: Image(
                      image: NetworkImage(
                        image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(140.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 20.0.w,
                            child: Text(
                              '$name',
                              style: TextStyle(
                                color: secondaryTextColor,
                                fontSize: caption.sp - 1,
                                fontWeight: FontWeight.w800,
                              ),
                              overflow: TextOverflow.clip,
                              maxLines: 2,
                            ),
                          ),
                          Container(
                            width: 20.0.w,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Rp. $price',
                                  style: TextStyle(
                                    color: secondaryTextColor,
                                    fontSize: caption.sp - 2,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'per jam',
                                  style: TextStyle(
                                    fontSize: overline.sp - 2,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '$availability',
                            style: TextStyle(
                              fontSize: overline.sp - 1,
                              color: '$availability'.toUpperCase() == 'TERSEDIA'
                                  ? successColor
                                  : errorColor,
                            ),
                          ),
                        ],
                      ),
                      _buildRatingStars(rating),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(2.0.w),
                            width: getProportionateScreenWidth(90.0),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius:
                                  BorderRadius.circular(defaultPadding),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '$times',
                              style: TextStyle(
                                fontSize: overline.sp - 3,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
