import 'package:flutter/material.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/views/account/components/body.dart';

class AccountScreen extends StatelessWidget {
  static String routeName = "/account";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: primaryBackgroundColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Edit Akun",
          style: TextStyle(
            color: primaryTextColor,
            fontSize: headline6,
          ),
        ),
      ),
      body: Body(),
    );
  }
}
