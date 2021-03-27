import 'package:flutter/material.dart';
import 'package:parking_u/styles/color_style.dart';
import 'package:parking_u/styles/font_style.dart';
import 'package:parking_u/ui/base_widget.dart';
import 'package:sizer/sizer.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10.0.w),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 5.0.h),
                  Text(
                    'Ayo cari tempat parkirmu sekarang !',
                    style: headlineGreet,
                  ),
                  SizedBox(height: 10.0.h),
                  Image(
                    image: AssetImage('assets/images/login.png'),
                  ),
                  SizedBox(height: 10.0.h),
                  ElevatedButton(
                    child: Text('Masuk'),
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      onPrimary: Colors.white,
                      shadowColor: secondaryColor,
                      elevation: 5,
                      padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(height: 2.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum punya akun? ',
                        style: headlineInfo,
                      ),
                      GestureDetector(
                        child: new Text(
                          'Daftar',
                          style: headlineInfoBold,
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
