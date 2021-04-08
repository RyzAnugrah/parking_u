import 'package:flutter/material.dart';
import 'package:parking_u/size_config.dart';

const primaryColor = Color(0xFF1A659E);
const secondaryColor = Color(0xFFF8CD12);
const primaryTextColor = Color(0xFFFFFFFF);
const secondaryTextColor = Color(0xFF08080D);
const primaryBackgroundColor = Color(0xFFFFFFFF);
const secondaryBackgroundColor = Color(0xFFF6F6F6);
const errorColor = Color(0xFFD11313);
const infoColor = Color(0xFF0569FF);
const successColor = Color(0xFF3AC430);
const pendingColor = Color(0xFFFE9705);

const double headline4 = 33.0;
const double headline5 = 23.0;
const double headline6 = 19.0;
const double subtitle1 = 15.0;
const double subtitle2 = 13.0;
const double bodyText1 = 15.0;
const double bodyText2 = 13.0;
const double caption = 12.0;
const double overline = 10.0;

// const double backIconSize = 6.0;

const animationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: primaryTextColor,
  height: 1.5,
);

const double defaultPadding = 20.0;
const double appBarHeight = 7.0;

final borderRadius = BorderRadius.circular(18.0);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    vertical: getProportionateScreenWidth(15),
  ),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      getProportionateScreenWidth(15),
    ),
    borderSide: BorderSide(color: primaryTextColor),
  );
}
