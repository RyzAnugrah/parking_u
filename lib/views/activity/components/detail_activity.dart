import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'list_activity.dart';

void displayBottomSheet(BuildContext context) {
  SizeConfig().init(context);
  Size size = MediaQuery.of(context).size;
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius,
    ),
    context: context,
    builder: (ctx) {
      return SafeArea(
              child: Container(
          // padding: EdgeInsets.all(10.0.w),
          // padding: EdgeInsets.symmetric(
          //     horizontal: getProportionateScreenWidth(defaultPadding),
          //     vertical: getProportionateScreenHeight(defaultPadding + 10)),
          height: 60.0.h,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: Image.asset('assets/images/list_parking/anu-jaya.png',
                        // width: 300,
                        height: getProportionateScreenHeight(180),
                        fit: BoxFit.fill),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: getProportionateScreenWidth(defaultPadding),
                        right: getProportionateScreenWidth(defaultPadding),
                        top: getProportionateScreenHeight(defaultPadding),
                        bottom:
                            getProportionateScreenHeight(defaultPadding - 15)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.5,
                          child: AutoSizeText(
                            "Fadlan Sentosa",
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: bodyText2.sp,
                                fontWeight: FontWeight.w800,
                                color: secondaryTextColor),
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          // width: SizeConfig.screenWidth * 0.7,
                          child: Text(
                            "Pending",
                            style: TextStyle(
                                fontSize: caption.sp, color: secondaryTextColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(defaultPadding),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            right: 10,
                          ),
                          child: Icon(Icons.gps_fixed,
                              color: secondaryTextColor, size: 5.0.w),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.7,
                          child: Text(
                            ("Jalan Mayor Oking"),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: caption.sp - 2,
                              color: secondaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(5)),
                   Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(defaultPadding),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            right: 10,
                          ),
                          child: Icon(Icons.date_range_outlined,
                              color: secondaryTextColor, size: 5.0.w),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.7,
                          child: Text(
                            ("Sabtu, 14 September 2021"),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: caption.sp - 2,
                              color: secondaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(5)),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(defaultPadding),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            right: 10,
                          ),
                          child: Icon(Icons.access_time_outlined,
                              color: secondaryTextColor, size: 5.0.w),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.7,
                          child: Text(
                            ("2 Jam"),
                            style: TextStyle(
                              fontSize: caption.sp - 2,
                              color: secondaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(5)),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(defaultPadding),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            right: 10,
                          ),
                          child: Icon(Icons.monetization_on_outlined,
                              color: secondaryTextColor, size: 5.0.w),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.7,
                          child: Text(
                            ("Rp6000"),
                            style: TextStyle(
                              fontSize: caption.sp - 2,
                              color: secondaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(5)),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(defaultPadding),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            right: 10,
                          ),
                          child: Icon(Icons.map_outlined,
                              color: secondaryTextColor, size: 5.0.w),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.7,
                          child: Text(
                            ("Buka Google Maps"),
                            style: TextStyle(
                              fontSize: caption.sp - 2,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(defaultPadding)),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(defaultPadding),
                    ),
                    child: Column(
                      children: [
                        bookingButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget bookingButton() {
  return ElevatedButton(
    child: Text(
      'Scan QR',
      style: TextStyle(fontSize: caption.sp, color: secondaryTextColor),
    ),
    style: ElevatedButton.styleFrom(
      primary: secondaryColor,
      elevation: 5,
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(100),
          vertical: getProportionateScreenHeight(17)),
      shape: new RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
    ),
    onPressed: () {},
  );
}
