import 'package:flutter/material.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/enums.dart';
import 'package:parking_u/components/custom_bottom_nav_bar.dart';
import 'package:parking_u/views/home/components/body.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  final String token;
  const HomeScreen({Key key, this.token}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
