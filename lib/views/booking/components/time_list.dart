import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';

class TimeList extends StatelessWidget {
  const TimeList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TimeListCard(
                hours: "0 - 1",
                cost: 3000,
                press: () {},
              ),
              TimeListCard(
                hours: "1 - 2",
                cost: 5000,
                press: () {},
              ),TimeListCard(
                hours: "2 - 3",
                cost: 7000,
                press: () {},
              ),TimeListCard(
                hours: "3 - 4",
                cost: 9000,
                press: () {},
              ),TimeListCard(
                hours: "4 - 5",
                cost: 11000,
                press: () {},
              ),TimeListCard(
                hours: "5 - 6",
                cost: 13000,
                press: () {},
              ),TimeListCard(
                hours: "6 - 7",
                cost: 15000,
                press: () {},
              ),TimeListCard(
                hours: "7 - 8",
                cost: 17000,
                press: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TimeListCard extends StatelessWidget {
  const TimeListCard({
    Key key,
     @required this.hours,
    @required this.cost,
    @required this.press,
  }) : super(key: key);

  final String hours;
  final int cost;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(150),
          height: getProportionateScreenWidth(150),
          child: Padding(
            padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10),
                    vertical: getProportionateScreenWidth(20),
                  ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: secondaryTextColor),
                    borderRadius: borderRadius,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                                    '$hours',
                                    style: TextStyle(
                                      color: secondaryTextColor,
                                      fontSize: bodyText2.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  ),
                      ),
                      Container(
                        child: Text(
                                    'per jam',
                                    style: TextStyle(
                                      color: secondaryTextColor,
                                      fontSize: caption.sp - 2,
                                      fontWeight: FontWeight.w100,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Text(
                                    'Rp$cost',
                                    style: TextStyle(
                                      color: secondaryTextColor,
                                      fontSize: caption.sp - 1,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
