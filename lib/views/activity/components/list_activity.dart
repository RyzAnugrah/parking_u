import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';
import 'package:parking_u/views/activity/components/detail_activity.dart';

class ListActivity extends StatelessWidget {
  const ListActivity({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          ListActivityHere(
            image: "assets/images/list_parking/anu-jaya.png",
            name: "Fadlan Sentosa",
            price: 3000,
            length: 2,
            availability: 'Pending',
            rating: 5,
            startTimes: '09:00',
            finishTimes: '20:00',
            press: () {},
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          ListActivityHere(
            image: "assets/images/list_parking/anu-jaya.png",
            name: "Fadlan Sentosa",
            price: 3000,
            length: 2,
            availability: 'Sedang Parkir',
            rating: 5,
            startTimes: '09:00',
            finishTimes: '20:00',
            press: () {},
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          ListActivityHere(
            image: "assets/images/list_parking/anu-jaya.png",
            name: "Fadlan Sentosa",
            price: 3000,
            length: 2,
            availability: 'Selesai',
            rating: 5,
            startTimes: '09:00',
            finishTimes: '20:00',
            press: () {},
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
        ],
      ),
    );
  }
}

class ListActivityHere extends StatelessWidget {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  const ListActivityHere({
    Key key,
    @required this.name,
    @required this.image,
    @required this.length,
    @required this.press,
    @required this.price,
    @required this.availability,
    @required this.rating,
    @required this.startTimes,
    @required this.finishTimes,
  }) : super(key: key);

  final String name, image, availability, startTimes, finishTimes;
  final int length, price, rating;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(defaultPadding),
      ),
      child: GestureDetector(
        onTap: () => displayBottomSheet(context),
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
                              '$name',
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
                                  'Rp$price',
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
                            '$length Km',
                            style: TextStyle(
                              fontSize: overline.sp - 1,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            ' - $availability',
                            style: TextStyle(
                              fontSize: overline.sp - 1,
                              color: successColor,
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
                              '$startTimes - $finishTimes',
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
