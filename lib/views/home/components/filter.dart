import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Filter extends StatefulWidget {
  Filter();

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // Size size = MediaQuery.of(context).size;

    void displayBottomSheet(BuildContext context) {
      SizeConfig().init(context);
      // Size size = MediaQuery.of(context).size;
      showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        context: context,
        builder: (ctx) {
          return Container(
            // padding: EdgeInsets.all(10.0.w),
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(defaultPadding),
                vertical: getProportionateScreenHeight(defaultPadding + 10)),
            height: 55.0.h,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Urutkan berdasarkan',
                      style: TextStyle(
                        fontSize: bodyText1.sp,
                        color: secondaryTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.0.h),
                SizedBox(height: 2.0.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun? ',
                      style: TextStyle(
                          fontSize: caption.sp, color: secondaryTextColor),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(defaultPadding + 10),
          vertical: getProportionateScreenHeight(defaultPadding)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.7,
                    child: Text(
                      "Rekomendasi \nParkir Terdekat",
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(bodyText2),
                          color: secondaryTextColor),
                    ),
                  ),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Icon(Icons.filter_alt_outlined,
                        size: getProportionateScreenWidth(30.0),
                        color: secondaryTextColor),
                    onPressed: () {
                      displayBottomSheet(context);
                    },
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
