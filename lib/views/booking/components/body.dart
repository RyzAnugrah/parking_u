import 'package:flutter/material.dart';
import 'package:parking_u/models/parkir_model.dart';
import 'package:sizer/sizer.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';
import 'package:parking_u/views/booking/components/booking_details.dart';
import 'package:parking_u/views/booking/components/payment.dart';
import 'package:parking_u/views/booking/components/time_list.dart';
// import 'package:parking_u/views/home/home_screen.dart';

class Body extends StatefulWidget {
  final ParkirModel item;

  const Body({Key key, this.item}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
                widget.item.namaParkir,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: headline6.sp,
                  color: secondaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Container(
            child: SizedBox(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      right: 5,
                    ),
                    child: Icon(
                      Icons.gps_fixed,
                      size: 4.0.w,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.7,
                    child: Text(
                      widget.item.lokasiParkir,
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return BookingDetails(item: widget.item);
                          },
                        ),
                      ),
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
                        "Lahan Tersedia: " +
                            widget.item.lahanTersedia.toString() +
                            " / " +
                            widget.item.totalLahan.toString(),
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: caption.sp - 2,
                          color: secondaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
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
                        "Lahan Tidak Tersedia: " +
                            widget.item.lahanTidakTersedia.toString() +
                            " / " +
                            widget.item.totalLahan.toString(),
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: caption.sp - 2,
                          color: secondaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
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
                        "Waktu Buka:" + widget.item.jam,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: caption.sp - 2,
                          color: secondaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
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
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          TimeList(item: widget.item),
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
      style: TextStyle(
        fontSize: bodyText1.sp,
        color: secondaryTextColor,
      ),
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
    // onPressed: checkoutHandler,
    // onPressed: () {
    //   AwesomeDialog(
    //       context: context,
    //       animType: AnimType.SCALE,
    //       headerAnimationLoop: false,
    //       dialogType: DialogType.SUCCES,
    //       title: 'Checkout Berhasil',
    //       desc: 'Lakukan Validasi Pesanan di Tempat Masuk Parkir',
    //       btnOkOnPress: () {
    //         debugPrint('Success');
    //         Navigator.of(context).pushReplacement(
    //           MaterialPageRoute(builder: (_) {
    //             return HomeScreen();
    //           }),
    //         );
    //       },
    //       btnOkIcon: Icons.check_circle,
    //       onDissmissCallback: () {
    //         debugPrint('Dialog Dissmiss from callback');
    //         Navigator.of(context).pushReplacement(
    //           MaterialPageRoute(builder: (_) {
    //             return HomeScreen();
    //           }),
    //         );
    //       })
    //     ..show();
    // },
  );
}
