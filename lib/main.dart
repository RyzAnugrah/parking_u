import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_preview/device_preview.dart';
import 'package:parking_u/models/parkir_model.dart';
import 'package:parking_u/models/riwayat_model.dart';
import 'package:sizer/sizer.dart';
import 'package:parking_u/models/auth_model.dart';
import 'package:parking_u/routes.dart';
import 'package:parking_u/theme.dart';
import 'package:parking_u/utils/shared_prefs.dart';
import 'package:parking_u/views/splash_screen/splash_screen.dart';
import 'package:parking_u/views/home/home_screen.dart';
import 'package:parking_u/views/login/login_screen.dart';

UserModel user;
String searchKeyword;
List<ParkirModel> listParkir = [];
List<RiwayatModel> listRiwayat = [];

void main() => runApp(
      // DevicePreview(
      //   enabled: !kReleaseMode, // Ensures that it is disabled in release mode
      //   builder: (context) => MyApp(),
      // ),
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizerUtil().init(constraints, orientation);
            return MaterialApp(
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              title: 'Parking.u',
              debugShowCheckedModeBanner: false,
              theme: theme(),
              initialRoute: SplashScreen.routeName,
              routes: routes,
            );
          },
        );
      },
    );
  }
}

class BaseWidget extends StatefulWidget {
  const BaseWidget({Key key}) : super(key: key);

  @override
  _BaseWidgetState createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  bool isLogin = false;

  void checkLoginState() async {
    String token;
    try {
      token = await SharedPref.getToken();
      if (token != null) {
        isLogin = true;

        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    checkLoginState();
  }

  @override
  Widget build(BuildContext context) {
    return isLogin ? HomeScreen() : LoginScreen();
  }
}
