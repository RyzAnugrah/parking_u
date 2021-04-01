import 'package:flutter/widgets.dart';

import 'package:parking_u/views/home/home_screen.dart';
import 'package:parking_u/views/splash_screen/splash_screen.dart';
import 'package:parking_u/views/login/login_screen.dart';
import 'package:parking_u/views/profile/profile_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
