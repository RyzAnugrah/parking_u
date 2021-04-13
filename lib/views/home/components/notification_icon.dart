import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:parking_u/size_config.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    Key key,
    @required this.svgSrc,
    this.numOfitem = 0,
    @required this.press,
  }) : super(key: key);

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            child: Column(
              children: [
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    Icons.notifications_none_outlined,
                    size: 8.0.w,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          if (numOfitem != 0)
            Positioned(
              top: 1.0,
              right: 2.0,
              child: Container(
                height: getProportionateScreenWidth(16),
                width: getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.2.w,
                    color: Colors.white,
                  ),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
