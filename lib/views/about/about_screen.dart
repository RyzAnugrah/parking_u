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
                      'The increase in the number of vehicles and reduced parking space in urban areas makes it difficult for people to find parking space, sometimes the available parking lots are full, making us have to find another parking space.',
                      style: TextStyle(
                        color: secondaryTextColor,
                        fontSize: bodyText2,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: defaultPadding),
                    Text(
                      'Parking.u is a mobile app that use to find and book a parking area easily with various payment method.',
                      style: TextStyle(
                        color: secondaryTextColor,
                        fontSize: bodyText2,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: defaultPadding),
                    Text(
                      'With geo-location icon to represent a location that people use to find parking space and power button to represent a vehicle. we bring our app with cheerfull and trustness with jonquil and shapired blue as primary color and secondary color. with this brand identity we hope user can find parking space easily',
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
