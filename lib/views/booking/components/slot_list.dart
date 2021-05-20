import 'package:flutter/material.dart';
// import 'package:parking_u/main.dart';
import 'package:parking_u/models/parkir_model.dart';
import 'package:sizer/sizer.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';

class SlotList extends StatefulWidget {
  final ParkirModel item;

  const SlotList({Key key, this.item}) : super(key: key);

  @override
  _SlotListState createState() => _SlotListState();
}

class _SlotListState extends State<SlotList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: GridView.builder(
            itemCount: widget.item.lahanTersedia ~/ 2,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 4.0,
            ),
            primary: false,
            padding: const EdgeInsets.all(10.0),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return SlotListCard(
                number: ++index,
                available: true,
                press: () {},
              );
            },
            // children: [
            //   SlotListCard(
            //     number: 1,
            //     available: false,
            //     press: () {},
            //   ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: GridView.builder(
            itemCount: widget.item.lahanTidakTersedia,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 4.0,
            ),
            primary: false,
            padding: const EdgeInsets.all(10.0),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return SlotListCard(
                number: ++index + (widget.item.lahanTersedia ~/ 2),
                available: false,
                press: () {},
              );
            },
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: GridView.builder(
            itemCount: widget.item.lahanTersedia ~/ 2,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 4.0,
            ),
            primary: false,
            padding: const EdgeInsets.all(10.0),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return SlotListCard(
                number: ++index +
                    (widget.item.lahanTersedia ~/ 2) +
                    (widget.item.lahanTidakTersedia),
                available: true,
                press: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}

class SlotListCard extends StatefulWidget {
  const SlotListCard({
    Key key,
    @required this.number,
    @required this.press,
    @required this.available,
  }) : super(key: key);

  final int number;
  final GestureTapCallback press;
  final bool available;

  @override
  _SlotListCardState createState() => _SlotListCardState();
}

class _SlotListCardState extends State<SlotListCard> {
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
          // setState(() => _colorTap = !_colorTap),
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
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 35.0,
                    vertical: 25.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryBackgroundColor,
                    border: Border.all(color: secondaryTextColor),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          '${widget.number}',
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
