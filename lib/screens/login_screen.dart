import 'package:flutter/material.dart';
import 'package:parking_u/screens/register_screen.dart';
import 'package:parking_u/mixins/validation.dart';
import 'package:parking_u/styles/color_style.dart';
import 'package:parking_u/styles/font_style.dart';
import 'package:parking_u/ui/base_widget.dart';
import 'package:sizer/sizer.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({Key key}) : super(key: key);

  @override
  _LoginScreenPageState createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> with Validation {
  final formKey = GlobalKey<FormState>();

  String telp = '';
  String password = '';

  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          padding: EdgeInsets.all(10.0.w),
          height: 60.0.h,
          child: Center(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Masuk',
                      style: headlineGreet,
                    ),
                  ],
                ),
                SizedBox(height: 2.0.h),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(top: 2.0.h),
                        child: Text(
                          'Nomor Telepon',
                          style: headlineInfo,
                        ),
                      ),
                      telpField(),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(top: 2.0.h),
                        child: Text(
                          'Password',
                          style: headlineInfo,
                        ),
                      ),
                      passwordField(),
                      SizedBox(height: 2.0.h),
                      loginButton(),
                    ],
                  ),
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreenPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.all(10.0.w),
          child: Center(
            child: ListView(
              children: [
                Text(
                  'Ayo cari tempat parkirmu sekarang !',
                  style: headlineGreet,
                ),
                SizedBox(height: 5.0.h),
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
                  onPressed: () {
                    displayBottomSheet(context);
                  },
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreenPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget telpField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Isi Nomor Telepon',
        border: OutlineInputBorder(),
      ),
      validator: validateTelp,
      onSaved: (String value) {
        telp = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Isi Password',
        border: OutlineInputBorder(),
      ),
      validator: validatePassword,
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget loginButton() {
    return ElevatedButton(
      child: Text('Masuk'),
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        onPrimary: Colors.white,
        shadowColor: secondaryColor,
        elevation: 5,
        padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
      ),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          // Temp
          print('Nomor Telepon: $telp');
          print('Password: $password');
        }
      },
    );
  }
}
