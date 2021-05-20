import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';
import 'package:parking_u/mixins/validation.dart';
import 'package:parking_u/main.dart';
import 'package:parking_u/models/auth_model.dart';
import 'package:parking_u/services/auth_service.dart';
import 'package:parking_u/views/home/home_screen.dart';
import 'package:parking_u/views/login/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";

  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Validation {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailTC = TextEditingController();
  TextEditingController passTC = TextEditingController();

  String email = '';
  String password = '';

  void loginHandler() async {
    log(emailTC.text);
    log(passTC.text);
    try {
      if (formKey.currentState.validate()) {
        formKey.currentState.save();
        await AuthService.login(
          emailTC.text,
          passTC.text,
        ).then(
          (value) {
            if (value is UserModel) {
              setState(() {
                user = value;
              });
              print('Berhasil Masuk');
              AwesomeDialog(
                context: context,
                animType: AnimType.SCALE,
                dialogType: DialogType.SUCCES,
                headerAnimationLoop: false,
                dismissOnTouchOutside: false,
                dismissOnBackKeyPress: false,
                autoHide: Duration(seconds: 6),
                title: 'Berhasil Masuk',
                desc: 'Anda Berhasil Masuk',
                btnOkText: 'Masuk Sekarang',
                btnOkOnPress: () {
                  debugPrint('Berhasil Masuk');
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) {
                        return HomeScreen();
                      },
                    ),
                  );
                },
                onDissmissCallback: () {
                  debugPrint('Berhasil Masuk');
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) {
                        return HomeScreen();
                      },
                    ),
                  );
                },
              )..show();
            } else {
              print('Gagal Masuk');
              AwesomeDialog(
                context: context,
                animType: AnimType.SCALE,
                dialogType: DialogType.ERROR,
                headerAnimationLoop: false,
                dismissOnTouchOutside: false,
                dismissOnBackKeyPress: false,
                autoHide: Duration(seconds: 6),
                title: 'Gagal Masuk',
                desc: 'Anda Gagal Masuk',
                btnOkText: 'Email dan Password Tidak Cocok',
                btnOkColor: errorColor,
                btnOkOnPress: () {
                  debugPrint('Gagal Masuk');
                },
                onDissmissCallback: () {
                  debugPrint('Gagal Masuk');
                },
              )..show();
            }
          },
        );
      }
    } catch (e) {
      print('catch error');
      print(e.toString());
    }
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(
                  'No',
                  style: TextStyle(color: secondaryTextColor),
                ),
              ),
              new TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: new Text(
                  'Yes',
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  void displayBottomSheet(BuildContext context) {
    SizeConfig().init(context);
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
      ),
      context: context,
      builder: (ctx) {
        return Container(
          // padding: EdgeInsets.all(10.0.w),
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(defaultPadding),
            vertical: getProportionateScreenHeight(defaultPadding + 10),
          ),
          height: 55.0.h,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: headline5,
                      color: secondaryTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          EdgeInsets.only(top: SizeConfig.screenHeight * 0.02),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    emailField(),
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          EdgeInsets.only(top: SizeConfig.screenHeight * 0.02),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    passwordField(),
                    SizedBox(height: 3.0.h),
                    loginButton(),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum punya akun? ',
                    style:
                        TextStyle(fontSize: caption, color: secondaryTextColor),
                  ),
                  GestureDetector(
                    child: new Text(
                      'Daftar',
                      style: TextStyle(
                        fontSize: caption,
                        color: secondaryTextColor,
                        fontWeight: FontWeight.w800,
                      ),
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.only(
            top: size.height * 0.08,
            bottom: size.height * 0.07,
            left: 40,
            right: 40,
          ),
          child: Center(
            child: ListView(
              children: [
                Text(
                  'Ayo cari tempat parkirmu sekarang!',
                  style: TextStyle(
                    fontSize: headline5.sp,
                    color: secondaryTextColor,
                  ),
                ),
                SizedBox(height: 5.0.h),
                Image(
                  image: AssetImage('assets/images/login.png'),
                ),
                SizedBox(height: 10.0.h),
                ElevatedButton(
                  child: Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: bodyText2.sp,
                      color: primaryTextColor,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    elevation: 5,
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(16),
                    ),
                    shape: new RoundedRectangleBorder(
                      borderRadius: borderRadius,
                    ),
                  ),
                  onPressed: () {
                    displayBottomSheet(context);
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(defaultPadding),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun? ',
                      style: TextStyle(
                          fontSize: caption, color: secondaryTextColor),
                    ),
                    GestureDetector(
                      child: new Text(
                        'Daftar',
                        style: TextStyle(
                          fontSize: caption,
                          color: secondaryTextColor,
                          fontWeight: FontWeight.w800,
                        ),
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
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      controller: emailTC,
      cursorColor: secondaryTextColor,
      style: TextStyle(fontSize: caption, color: secondaryTextColor),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
        labelText: 'Email',
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        hintText: 'Isi Email',
        contentPadding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(defaultPadding - 5),
          vertical: getProportionateScreenHeight(12),
        ),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
        ),
      ),
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      controller: passTC,
      cursorColor: secondaryTextColor,
      obscureText: true,
      style: TextStyle(
        fontSize: caption,
        color: secondaryTextColor,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.lock_outline,
          color: Colors.grey,
        ),
        labelText: 'Kata Sandi',
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        hintText: 'Isi Kata Sandi',
        contentPadding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(defaultPadding - 5),
          vertical: getProportionateScreenHeight(12),
        ),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
        ),
      ),
      validator: validatePassword,
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget loginButton() {
    return ElevatedButton(
      child: Text(
        'Masuk',
        style: TextStyle(
          fontSize: bodyText2,
          color: primaryTextColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        // onPrimary: Colors.white,
        // shadowColor: secondaryColor,
        elevation: 5,
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(142),
          vertical: getProportionateScreenHeight(17),
        ),
        shape: new RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      onPressed: loginHandler,
    );
  }
}
