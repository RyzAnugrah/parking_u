import 'package:flutter/material.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Widget build(context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(
          left: defaultPadding,
          bottom: defaultPadding,
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
                'Notifikasi',
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: headline5,
                ),
              ),
              SizedBox(height: defaultPadding),
              Container(
                padding: EdgeInsets.only(right: defaultPadding),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadius,
                  ),
                  child: InkWell(
                    borderRadius: borderRadius,
                    splashColor: primaryColor,
                    onTap: () {
                      // Temp
                      print('Card tapped.');
                    },
                    child: Container(
                      padding: EdgeInsets.all(defaultPadding),
                      child: SizedBox(
                        height: 180.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat Datang di Parking.u!',
                              style: TextStyle(
                                color: secondaryTextColor,
                                fontSize: headline6,
                              ),
                            ),
                            Text(
                              'Greeting',
                              style: TextStyle(
                                color: infoColor,
                                fontSize: bodyText2,
                              ),
                            ),
                            SizedBox(height: defaultPadding),
                            Text(
                              'Ayo baca ketentuan penggunaan Parking.u biar lebih mudah cari parkir',
                              style: TextStyle(
                                color: secondaryTextColor,
                                fontSize: bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: defaultPadding),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadius,
                  ),
                  child: InkWell(
                    borderRadius: borderRadius,
                    splashColor: primaryColor,
                    onTap: () {
                      // Temp
                      print('Card tapped.');
                    },
                    child: Container(
                      padding: EdgeInsets.all(defaultPadding),
                      child: SizedBox(
                        height: 150.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Yeay! Parkir anda sudah dibayarkan',
                              style: TextStyle(
                                color: secondaryTextColor,
                                fontSize: headline6,
                              ),
                            ),
                            Text(
                              'Pemberitahuan',
                              style: TextStyle(
                                color: successColor,
                                fontSize: bodyText2,
                              ),
                            ),
                            SizedBox(height: defaultPadding),
                            Text(
                              'Lihat detail parkir anda disini',
                              style: TextStyle(
                                color: secondaryTextColor,
                                fontSize: bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: defaultPadding),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadius,
                  ),
                  child: InkWell(
                    borderRadius: borderRadius,
                    splashColor: primaryColor,
                    onTap: () {
                      // Temp
                      print('Card tapped.');
                    },
                    child: Container(
                      padding: EdgeInsets.all(defaultPadding),
                      child: SizedBox(
                        height: 150.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Oops! Terjadi Kesalahan saat booking',
                              style: TextStyle(
                                color: secondaryTextColor,
                                fontSize: headline6,
                              ),
                            ),
                            Text(
                              'Peringatan',
                              style: TextStyle(
                                color: errorColor,
                                fontSize: bodyText2,
                              ),
                            ),
                            SizedBox(height: defaultPadding),
                            Text(
                              'Cari tahu penyebab kesalahan anda',
                              style: TextStyle(
                                color: secondaryTextColor,
                                fontSize: bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
