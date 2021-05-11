import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';
import 'package:parking_u/models/riwayat_model.dart';
import 'package:parking_u/services/riwayat_service.dart';
import 'package:parking_u/views/activity/components/detail_activity.dart';

class ListActivity extends StatefulWidget {
  const ListActivity({Key key}) : super(key: key);

  @override
  _ListActivityState createState() => _ListActivityState();
}

class _ListActivityState extends State<ListActivity> {
  RiwayatModel riwayat;
  bool loading = false;

  void fetchRiwayatList() async {
    try {
      await RiwayatService.getRiwayat('1').then((value) {
        if (value is RiwayatModel) {
          print('Success');
          setState(() {
            riwayat = value;
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
    fetchRiwayatList();
    loading = true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 25.0.h,
            child: loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.0.w,
                      vertical: 4.0.w,
                    ),
                    child: ListActivityHere(
                      image: "assets/images/list_parking/anu-jaya.png",
                      lahanTerpilih: riwayat.lahanTerpilih,
                      tarif: riwayat.tarif,
                      jenisPembayaran: riwayat.jenisPembayaran,
                      statusPembayaran: riwayat.statusPembayaran,
                      waktuBooking: riwayat.waktuBooking,
                      press: () => displayBottomSheet(context, riwayat),
                    ),
                  ),
          ),
          // SizedBox(
          //   height: getProportionateScreenHeight(20),
          // ),
          // ListActivityHere(
          //   image: "assets/images/list_parking/anu-jaya.png",
          //   name: "Fadlan Sentosa",
          //   price: 3000,
          //   length: 2,
          //   availability: 'Sedang Parkir',
          //   rating: 5,
          //   startTimes: '09:00',
          //   finishTimes: '20:00',
          //   press: () {},
          // ),
        ],
      ),
    );
  }
}

class ListActivityHere extends StatelessWidget {
  const ListActivityHere({
    Key key,
    @required this.lahanTerpilih,
    @required this.image,
    @required this.tarif,
    @required this.jenisPembayaran,
    @required this.statusPembayaran,
    @required this.waktuBooking,
    @required this.press,
  }) : super(key: key);

  final String lahanTerpilih,
      image,
      tarif,
      jenisPembayaran,
      statusPembayaran,
      waktuBooking;
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
                      // width: 200.0,
                      image: AssetImage(
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
                              '$lahanTerpilih',
                              style: TextStyle(
                                color: secondaryTextColor,
                                fontSize: caption.sp - 1,
                                fontWeight: FontWeight.w800,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          Container(
                            width: 20.0.w,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Rp. $tarif',
                                  style: TextStyle(
                                    color: secondaryTextColor,
                                    fontSize: caption.sp - 2,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Total Tarif',
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
                            '$jenisPembayaran',
                            style: TextStyle(
                              fontSize: overline.sp - 1,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            ' - $statusPembayaran',
                            style: TextStyle(
                              fontSize: overline.sp - 1,
                              color: successColor,
                            ),
                          ),
                        ],
                      ),
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
                              '$waktuBooking',
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
