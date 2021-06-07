import 'package:flutter/material.dart';
import 'package:parking_u/components/custom_bottom_nav_bar.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/enums.dart';
import 'package:parking_u/views/activity/components/body.dart';

class ActivityScreen extends StatelessWidget {
  static String routeName = "/activity";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Riwayat Pesanan",
          style: TextStyle(
            color: primaryTextColor,
            fontSize: headline6,
          ),
        ),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.activity,
      ),
    );
  }
}
