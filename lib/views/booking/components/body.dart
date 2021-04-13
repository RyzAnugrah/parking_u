import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
// import 'package:auto_size_text/auto_size_text.dart';

import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';
import 'booking_details.dart';
import 'time_list.dart';
import 'payment.dart';
import 'success.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(defaultPadding),
        horizontal: getProportionateScreenWidth(defaultPadding),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(defaultPadding * 0.1),
              right: getProportionateScreenWidth(defaultPadding * 0.1),
            ),
            child: SizedBox(
              width: SizeConfig.screenWidth * 0.9,
              child: Text(
                ("Fadlan Sentosa"),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: headline6.sp,
                    color: secondaryTextColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
            child: SizedBox(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      right: 5,
                    ),
                    child: Icon(Icons.gps_fixed, size: 4.0.w),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.7,
                    child: Text(
                      ("Jalan Mayor Oking"),
                      maxLines: 1,
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
          ),
          SizedBox(
            height: getProportionateScreenHeight(defaultPadding),
          ),
          Container(
            child: SizedBox(
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingDetails(),
                        ),
                      )
                    },
                    child: Text(
                      ("Pilih Lahan Parkir"),
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: caption.sp - 1,
                          color: primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: SizedBox(
              child: Row(
                children: [
                  Column(
                    children: <Widget>[
                      Text(
                        ("Lahan Terpilih: B1 - E5"),
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: caption.sp - 2,
                            color: secondaryTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: SizedBox(
              child: Row(
                children: [
                  Column(
                    children: <Widget>[
                      Text(
                        ("Lahan Tersedia: 10 / 20"),
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: caption.sp - 2,
                            color: secondaryTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: SizedBox(
              child: Row(
                children: [
                  Column(
                    children: <Widget>[
                      Text(
                        ("Waktu Buka: 09:00 - 20:00"),
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: caption.sp - 2,
                            color: secondaryTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Container(
            child: SizedBox(
              child: Row(
                children: [
                  Column(
                    children: <Widget>[
                      Text(
                        ("Pilih Waktu"),
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: caption.sp - 1,
                            color: secondaryTextColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          TimeList(),
          Divider(),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Payment(),
          SizedBox(
            height: getProportionateScreenHeight(defaultPadding),
          ),
          bookingButton(context),
        ],
      ),
    );
  }
}

Widget bookingButton(BuildContext context) {
  return ElevatedButton(
    child: Text(
      'Checkout',
      style: TextStyle(fontSize: bodyText1.sp, color: secondaryTextColor),
    ),
    style: ElevatedButton.styleFrom(
      primary: secondaryColor,
      elevation: 5,
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(120),
        vertical: getProportionateScreenHeight(17),
      ),
      shape: new RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
    ),
    onPressed: () {
      displayBottomSheetSuccess(context);
    },
  );
}
