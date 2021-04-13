import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';

class Filter extends StatefulWidget {
  Filter();

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int _filterGroup = 1;

  final List<RadioGroup> _filterList = [
    RadioGroup(index: 1, text: "Terdekat"),
    RadioGroup(index: 2, text: "Termurah"),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    void displayBottomSheet(BuildContext context) {
      SizeConfig().init(context);
      showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        context: context,
        builder: (ctx) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(defaultPadding),
              vertical: getProportionateScreenHeight(defaultPadding + 10),
            ),
            height: 35.0.h,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Filter Pencarian',
                      style: TextStyle(
                        fontSize: bodyText1.sp,
                        color: secondaryTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    _buildRadioButton(),
                    SizedBox(
                      height: defaultPadding,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(defaultPadding + 10),
        vertical: getProportionateScreenHeight(defaultPadding),
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
                    width: SizeConfig.screenWidth * 0.7,
                    child: Text(
                      "Rekomendasi \nParkir Terdekat",
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(bodyText2),
                        color: secondaryTextColor,
                      ),
                    ),
                  ),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Icon(Icons.filter_alt_outlined,
                        size: getProportionateScreenWidth(30.0),
                        color: secondaryTextColor),
                    onPressed: () {
                      displayBottomSheet(context);
                    },
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRadioButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _filterList
          .map(
            (filterMap) => RadioListTile(
              title: Text(filterMap.text),
              value: filterMap.index,
              groupValue: _filterGroup,
              dense: false,
              onChanged: (value) {
                setState(
                  () {
                    _filterGroup = value;
                  },
                );
                Navigator.pop(context);
              },
            ),
          )
          .toList(),
    );
  }
}

class RadioGroup {
  final int index;
  final String text;
  RadioGroup({
    this.index,
    this.text,
  });
}
