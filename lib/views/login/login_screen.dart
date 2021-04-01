import 'package:flutter/material.dart';
import 'package:parking_u/constants.dart';
import 'package:sizer/sizer.dart';

import '../../size_config.dart';
import 'package:parking_u/mixins/validation.dart';
import 'package:parking_u/views/home/home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";

  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Validation {
  final formKey = GlobalKey<FormState>();

  String telp = '';
  String password = '';

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No', style: TextStyle(color: secondaryTextColor),),
          ),
          new TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes', style: TextStyle(color: primaryColor),),
          ),
        ],
      ),
    )) ?? false;
  }

  void displayBottomSheet(BuildContext context) {
    SizeConfig().init(context);
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      context: context,
      builder: (ctx) {
        return Container(
          // padding: EdgeInsets.all(10.0.w),
         padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(defaultPadding), vertical: getProportionateScreenHeight(defaultPadding + 10)),
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
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.02),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    telpField(),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.02),
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
        // margin: EdgeInsets.all(40),
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
                    fontSize: headline5.sp, color: secondaryTextColor),
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
                      fontSize: bodyText2.sp, color: primaryTextColor),
                ),
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  // onPrimary: Colors.white,
                  // shadowColor: secondaryColor,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(16)),
                  shape: new RoundedRectangleBorder(
                    borderRadius: borderRadius,
                  ),
                ),
                onPressed: () {
                  displayBottomSheet(context);
                },
              ),
              SizedBox(height: getProportionateScreenHeight(defaultPadding)),
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
      ),),
      
    );
  }

  Widget telpField() {
    return TextFormField(
      cursorColor: secondaryTextColor,
      style: TextStyle(fontSize: caption, color: secondaryTextColor),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone_iphone, color: Colors.grey),
        labelText: 'Nomor Telepon',
        labelStyle: TextStyle(
        color: Colors.grey,
          ),
        hintText: 'Isi Nomor Telepon',
        contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(defaultPadding - 5),
            vertical: getProportionateScreenHeight(12)),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,borderSide: BorderSide(color: primaryColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius, 
        ),
      ),
      validator: validateTelp,
      onSaved: (String value) {
        telp = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      cursorColor: secondaryTextColor,
      obscureText: true,
      style: TextStyle(fontSize: caption, color: secondaryTextColor),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_outline, color: Colors.grey),
        labelText: 'Kata Sandi',
        labelStyle: TextStyle(
        color: Colors.grey,
          ),
        hintText: 'Isi Kata Sandi',
       contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(defaultPadding - 5),
            vertical: getProportionateScreenHeight(12)),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,borderSide: BorderSide(color: primaryColor, width: 2.0),
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
        style: TextStyle(fontSize: bodyText2, color: primaryTextColor),
      ),
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        // onPrimary: Colors.white,
        // shadowColor: secondaryColor,
        elevation: 5,
       padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(142),
            vertical: getProportionateScreenHeight(17)),
        shape: new RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          // Temp
          print('Nomor Telepon: $telp');
          print('Password: $password');
        }
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            return HomeScreen();
          }),
        );
      },
    );
  }
}
