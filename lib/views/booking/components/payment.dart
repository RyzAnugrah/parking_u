import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';

class Payment extends StatefulWidget {
  Payment();

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int _filterGroup = 1;

  final List<RadioGroup> _filterList = [
    RadioGroup(index: 1, text: "Dompet Digital"),
    RadioGroup(index: 2, text: "Cash"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(0),
      ),
      child: GestureDetector(
        onTap: () => displayBottomSheet(context),
        child: Container(
          height: getProportionateScreenHeight(50),
          decoration: BoxDecoration(
            color: primaryBackgroundColor,
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.1.w,
                blurRadius: 1.0.w,
                offset: Offset(0, 0.2.h),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(10),
                    right: getProportionateScreenWidth(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50.0.w,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Pilih Metode Pembayaran',
                                  style: TextStyle(
                                    fontSize: caption.sp - 2,
                                    color: secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            // width: 50.0.w,
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.arrow_forward_ios_outlined,
                                    size: 5.0.w)
                              ],
                            ),
                          ),
                        ],
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

  void displayBottomSheet(BuildContext context) {
    SizeConfig().init(context);
    // Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      context: context,
      builder: (ctx) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(defaultPadding),
            vertical: getProportionateScreenHeight(defaultPadding),
          ),
          height: 50.0.h,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pilih Metode Pembayaran',
                    style: TextStyle(
                      fontSize: bodyText2.sp,
                      color: secondaryTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            "assets/images/virtual-payment-gopay.png",
                            fit: BoxFit.cover,
                            height: 50.0,
                            width: 50.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            "assets/images/virtual-payment-dana.png",
                            fit: BoxFit.cover,
                            height: 50.0,
                            width: 50.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            "assets/images/virtual-payment-ovo.png",
                            fit: BoxFit.cover,
                            height: 50.0,
                            width: 50.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            "assets/images/virtual-payment-linkaja.png",
                            fit: BoxFit.cover,
                            height: 50.0,
                            width: 50.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  _buildRadioButton(),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Anu Jaya',
                              style: TextStyle(
                                fontSize: bodyText2.sp,
                                color: secondaryTextColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              '15.50 WIB',
                              style: TextStyle(
                                fontSize: caption.sp,
                                color: secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lantai 1',
                              style: TextStyle(
                                fontSize: caption.sp,
                                color: secondaryTextColor,
                              ),
                            ),
                            Text(
                              'No.3',
                              style: TextStyle(
                                fontSize: caption.sp,
                                color: secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(defaultPadding),
                    ),
                    child: Column(
                      children: [
                        payButton(context),
                      ],
                    ),
                  ),
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

  Widget payButton(BuildContext context) {
    return ElevatedButton(
      child: Text(
        'Pilih Pembayaran',
        style: TextStyle(
          fontSize: caption.sp,
          color: primaryTextColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        elevation: 5,
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(80),
          vertical: getProportionateScreenHeight(17),
        ),
        shape: new RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
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
