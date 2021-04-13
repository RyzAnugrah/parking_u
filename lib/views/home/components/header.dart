import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sizer/sizer.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';
import 'package:parking_u/views/home/components/notification_icon.dart';
import 'package:parking_u/views/notification/notification_screen.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.75,
                    child: Text(
                      "Cari tempat parkirmu!",
                      style: TextStyle(
                        fontSize: caption.sp,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  NotificationIcon(
                    svgSrc: "",
                    numOfitem: 3,
                    press: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationScreen(),
                        ),
                      )
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      right: 10,
                    ),
                    child: Icon(
                      Icons.gps_fixed,
                      color: Colors.white,
                      size: 6.0.w,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.7,
                    child: AutoSizeText(
                      ("Lapangan Parkir PPBS D"),
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: bodyText1.sp,
                        color: primaryTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
