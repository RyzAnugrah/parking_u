import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';
import 'package:parking_u/views/booking/booking_screen.dart';

void displayBottomSheet(BuildContext context, item) {
  SizeConfig().init(context);
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
    ),
    context: context,
    builder: (ctx) {
      return SafeArea(
        child: Container(
          height: 58.0.h,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: Image.network(
                      item.linkImage,
                      height: getProportionateScreenHeight(180),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(defaultPadding),
                      right: getProportionateScreenWidth(defaultPadding),
                      top: getProportionateScreenHeight(defaultPadding),
                      bottom: getProportionateScreenHeight(defaultPadding - 15),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.5,
                          child: AutoSizeText(
                            item.namaParkir,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: bodyText2.sp,
                              fontWeight: FontWeight.w800,
                              color: secondaryTextColor,
                            ),
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          // width: SizeConfig.screenWidth * 0.7,
                          child: Text(
                            item.statusLahan,
                            style: TextStyle(
                              fontSize: caption.sp,
                              color: successColor,
                            ),
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
                          child: Icon(
                            Icons.gps_fixed,
                            color: secondaryTextColor,
                            size: 5.0.w,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.7,
                          child: Text(
                            item.lokasiParkir,
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
                  SizedBox(
                    height: getProportionateScreenHeight(5),
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
                          child: Icon(
                            Icons.access_time_outlined,
                            color: secondaryTextColor,
                            size: 5.0.w,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.7,
                          child: Text(
                            item.jam,
                            style: TextStyle(
                              fontSize: caption.sp - 2,
                              color: secondaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(5),
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
                          child: Icon(
                            Icons.monetization_on_outlined,
                            color: secondaryTextColor,
                            size: 5.0.w,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.7,
                          child: Text(
                            ("Rp." + item.harga.toString() + "/jam"),
                            style: TextStyle(
                              fontSize: caption.sp - 2,
                              color: secondaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(5),
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
                          child: Icon(
                            Icons.map_outlined,
                            color: secondaryTextColor,
                            size: 5.0.w,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.7,
                          child: InkWell(
                            child: new Text(
                              ("Buka Google Maps"),
                              style: TextStyle(
                                fontSize: caption.sp - 2,
                                color: primaryColor,
                              ),
                            ),
                            onTap: () async {
                              await launch(item.linkMap);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(defaultPadding),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(defaultPadding),
                    ),
                    child: Column(
                      children: [
                        bookingButton(context, item),
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

Widget bookingButton(BuildContext context, item) {
  return ElevatedButton(
    child: Text(
      'Booking Sekarang',
      style: TextStyle(
        fontSize: caption.sp,
        color: secondaryTextColor,
      ),
    ),
    style: ElevatedButton.styleFrom(
      primary: secondaryColor,
      elevation: 5,
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(95),
        vertical: getProportionateScreenHeight(17),
      ),
      shape: new RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
    ),
    onPressed: () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) {
            return BookingScreen(item: item);
          },
        ),
      );
    },
  );
}
