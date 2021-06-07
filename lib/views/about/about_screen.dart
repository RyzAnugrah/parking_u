import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  Widget build(context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(
          left: defaultPadding,
          // bottom: defaultPadding,
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
                'Tentang Kami',
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
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(defaultPadding),
                      child: SizedBox(
                        height: 180.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/images/logo-parking-u.png",
                                  width: 20.0.w,
                                ),
                                Image.asset(
                                  "assets/images/logo-parking-u-text.png",
                                  width: 40.0.w,
                                ),
                              ],
                            ),
                            SizedBox(height: defaultPadding),
                            Text(
                              'Cari parkir tidak pernah semudah ini!',
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
              Container(
                padding: EdgeInsets.only(right: defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Pertambahan jumlah kendaraan dan berkurangnya lahan parkir di perkotaan membuat masyarakat kesulitan mencari lahan parkir, terkadang lahan parkir yang tersedia penuh sehingga membuat kita harus mencari lahan parkir lain.',
                      style: TextStyle(
                        color: secondaryTextColor,
                        fontSize: bodyText2,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: defaultPadding),
                    Text(
                      'Parking.u adalah aplikasi mobile yang digunakan untuk mencari dan memesan tempat parkir dengan mudah dengan berbagai metode pembayaran.',
                      style: TextStyle(
                        color: secondaryTextColor,
                        fontSize: bodyText2,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: defaultPadding),
                    Text(
                      'Dengan ikon geo-lokasi untuk mewakili lokasi yang digunakan orang untuk menemukan tempat parkir dan ikon daya bertuliskan huruf "U" untuk mewakili kendaraanmu. Kami membawa aplikasi kami dengan ceria dan kepercayaan dengan warna kuning muda dan warna biru sebagai identitas aplikasi ini. Kami berharap pengguna dapat menemukan tempat parkir dengan mudah dan cepat.',
                      style: TextStyle(
                        color: secondaryTextColor,
                        fontSize: bodyText2,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
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
