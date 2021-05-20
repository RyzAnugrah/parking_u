import 'package:flutter/material.dart';
import 'package:parking_u/models/parkir_model.dart';
import 'package:sizer/sizer.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';
import 'package:parking_u/views/booking/components/slot_list.dart';

class BookingDetails extends StatefulWidget {
  static String routeName = "/notification";

  final ParkirModel item;

  const BookingDetails({Key key, this.item}) : super(key: key);

  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(defaultPadding),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/images/wave-top.png",
                ),
              ),
              Text(
                'Pilih Parkiranmu !',
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: headline5,
                ),
              ),
              SizedBox(height: defaultPadding),
              Text(
                'Tentukan posisi parkir',
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: headline6,
                ),
              ),
              SizedBox(height: defaultPadding),
              Text(
                widget.item.namaParkir,
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: bodyText1,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: defaultPadding),
              Container(
                padding: EdgeInsets.only(right: defaultPadding),
                child: SlotList(item: widget.item),
              ),
              SizedBox(height: defaultPadding),
              Container(
                padding: EdgeInsets.only(right: defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/ellipse-green.png",
                        ),
                        SizedBox(width: 1.0.w),
                        Text(
                          'Tersedia',
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: bodyText2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/ellipse-orange.png",
                        ),
                        SizedBox(width: 2.0.w),
                        Text(
                          'Telah Dipesan',
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: bodyText2,
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Image.asset(
                    //       "assets/images/ellipse-blue.png",
                    //     ),
                    //     SizedBox(width: 2.0.w),
                    //     Text(
                    //       'Dipilih',
                    //       style: TextStyle(
                    //         color: secondaryTextColor,
                    //         fontSize: bodyText2,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              SizedBox(height: defaultPadding),
              Container(
                  padding: EdgeInsets.only(
                    right: getProportionateScreenWidth(defaultPadding),
                  ),
                  child: bookingButton(context)),
              SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}

Widget bookingButton(BuildContext context) {
  return ElevatedButton(
    child: Text(
      'Kembali',
      style: TextStyle(
        fontSize: bodyText2.sp,
        color: primaryTextColor,
      ),
    ),
    style: ElevatedButton.styleFrom(
      primary: primaryColor,
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
      Navigator.pop(context);
    },
  );
}
