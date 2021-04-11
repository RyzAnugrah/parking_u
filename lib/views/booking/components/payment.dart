import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

void displayBottomSheet(BuildContext context) {
  SizeConfig().init(context);
  // Size size = MediaQuery.of(context).size;
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius,
    ),
    context: context,
    builder: (ctx) {
      return SafeArea(
        child: Container(
          
        ),
      );
    },
  );
}

Widget bookingButton(BuildContext context) {
  return ElevatedButton(
    child: Text(
      'Booking Sekarang',
      style: TextStyle(fontSize: caption.sp, color: secondaryTextColor),
    ),
    style: ElevatedButton.styleFrom(
      primary: secondaryColor,
      elevation: 5,
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(100),
          vertical: getProportionateScreenHeight(17)),
      shape: new RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
    ),
    onPressed: () {
      
    },
  );
}

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(0)),
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
                                      Icon(Icons.arrow_forward_ios_outlined, size: 5.0.w)
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
}
