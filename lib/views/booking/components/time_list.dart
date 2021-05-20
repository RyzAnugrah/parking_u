import 'package:flutter/material.dart';
import 'package:parking_u/models/parkir_model.dart';
import 'package:sizer/sizer.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';

class TimeList extends StatefulWidget {
  final ParkirModel item;

  const TimeList({Key key, this.item}) : super(key: key);

  @override
  _TimeListState createState() => _TimeListState();
}

class _TimeListState extends State<TimeList> {
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
                cost: widget.item.tarif1==null ? 3000 : widget.item.tarif1,
                // available: widget.item.tarif1==null ? false : widget.item.tarif1,
                available: true,
                press: () {},
              ),
              TimeListCard(
                hours: "1 - 2",
                cost: widget.item.tarif2==null ? 5000 : widget.item.tarif2,
                // available: widget.item.tarif2==null ? false : widget.item.tarif2,
                available: true,
                press: () {},
              ),
              TimeListCard(
                hours: "2 - 3",
                cost: widget.item.tarif3==null ? 7000 : widget.item.tarif3,
                // available: widget.item.tarif3==null ? false : widget.item.tarif3,
                available: true,
                press: () {},
              ),
            ],
          ),
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
                    'Tidak Tersedia',
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
                    "assets/images/ellipse-blue.png",
                  ),
                  SizedBox(width: 2.0.w),
                  Text(
                    'Dipilih',
                    style: TextStyle(
                      color: secondaryTextColor,
                      fontSize: bodyText2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TimeListCard extends StatefulWidget {
  const TimeListCard({
    Key key,
    @required this.hours,
    @required this.cost,
    @required this.available,
    @required this.press,
  }) : super(key: key);

  final String hours;
  final int cost;
  final bool available;
  final GestureTapCallback press;

  @override
  _TimeListCardState createState() => _TimeListCardState();
}

class _TimeListCardState extends State<TimeListCard> {
  bool availableColor;
  bool _colorTap = false;

  @override
  void initState() {
    super.initState();
    availableColor = widget.available;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GestureDetector(
        onTap: () => {
          setState(() => _colorTap = !_colorTap),
        },
        onDoubleTap: widget.press,
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
                    color: (availableColor
                        ? (_colorTap ? infoColor : successColor)
                        : pendingColor),
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
                          '${widget.hours}',
                          style: TextStyle(
                            color: primaryTextColor,
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
                            color: primaryTextColor,
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
                          'Rp${widget.cost}',
                          style: TextStyle(
                            color: primaryTextColor,
                            fontSize: caption.sp - 1,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
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
