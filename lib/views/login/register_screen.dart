import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/mixins/validation.dart';
import 'package:parking_u/size_config.dart';
import 'package:parking_u/models/auth_model.dart';
import 'package:parking_u/services/auth_service.dart';
import 'package:parking_u/views/login/login_screen.dart';

class RegisterScreenPage extends StatefulWidget {
  const RegisterScreenPage({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreenPage> with Validation {
  final formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String number = '';
  String typeTC = 'Mobil';
  String password = '';
  String confirmPassword = '';

  TextEditingController nameTC = TextEditingController();
  TextEditingController emailTC = TextEditingController();
  TextEditingController numberTC = TextEditingController();
  TextEditingController passTC = TextEditingController();

  void registerHandler() async {
    log(nameTC.text);
    log(emailTC.text);
    log(numberTC.text);
    log(typeTC);
    log(passTC.text);
    try {
      if (formKey.currentState.validate()) {
        formKey.currentState.save();
        await AuthService.register(
          nameTC.text,
          emailTC.text,
          numberTC.text,
          typeTC,
          passTC.text,
        ).then(
          (value) {
            if (value is UserModel) {
              print('Berhasil Daftar');
              AwesomeDialog(
                context: context,
                animType: AnimType.SCALE,
                dialogType: DialogType.SUCCES,
                headerAnimationLoop: false,
                dismissOnTouchOutside: false,
                dismissOnBackKeyPress: false,
                autoHide: Duration(seconds: 6),
                title: 'Berhasil Daftar',
                desc: 'Anda Berhasil Daftar',
                btnOkText: 'Masuk Sekarang',
                btnOkOnPress: () {
                  debugPrint('Berhasil Daftar');
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
                onDissmissCallback: () {
                  debugPrint('Berhasil Daftar');
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              )..show();
            } else {
              print('Gagal Daftar');
              AwesomeDialog(
                context: context,
                animType: AnimType.SCALE,
                dialogType: DialogType.ERROR,
                headerAnimationLoop: false,
                dismissOnTouchOutside: false,
                dismissOnBackKeyPress: false,
                autoHide: Duration(seconds: 6),
                title: 'Gagal Daftar',
                desc: 'Anda Gagal Daftar',
                btnOkText: 'Isi Form Dengan Benar',
                btnOkColor: errorColor,
                btnOkOnPress: () {
                  debugPrint('Gagal Daftar');
                },
                onDissmissCallback: () {
                  debugPrint('Gagal Daftar');
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

  Widget build(context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding,
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Daftar Akun',
                  style: TextStyle(
                    fontSize: headline5,
                    color: secondaryTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
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
                  nameField(),
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
                  typeField(),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 1.0.h),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  numberField(),
                  Container(
                    alignment: Alignment.topLeft,
                    padding:
                        EdgeInsets.only(top: SizeConfig.screenHeight * 0.02),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  passwordField(),
                  Container(
                    alignment: Alignment.topLeft,
                    padding:
                        EdgeInsets.only(top: SizeConfig.screenHeight * 0.02),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  confirmPasswordField(),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(15),
                        ),
                        child: Text(
                          'Dengan mendaftar anda berarti menyetujui kebijakan dan privasi pengguna',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 9.0.sp, color: secondaryTextColor),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  registerButton(),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah punya akun? ',
                  style: TextStyle(
                    fontSize: caption,
                    color: secondaryTextColor,
                  ),
                ),
                GestureDetector(
                  child: new Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: caption,
                      color: secondaryTextColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget nameField() {
    return TextFormField(
      controller: nameTC,
      style: TextStyle(
        fontSize: bodyText2,
        color: secondaryTextColor,
      ),
      cursorColor: secondaryTextColor,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person_outline,
          color: Colors.grey,
        ),
        labelText: 'Nama Lengkap',
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        hintText: 'Isi Nama Lengkap',
        contentPadding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(defaultPadding - 5),
          vertical: getProportionateScreenHeight(12),
        ),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: primaryColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
        ),
      ),
      validator: validateName,
      onSaved: (String value) {
        name = value;
      },
    );
  }

  Widget emailField() {
    return TextFormField(
      controller: emailTC,
      style: TextStyle(fontSize: bodyText2, color: secondaryTextColor),
      cursorColor: secondaryTextColor,
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

  Widget typeField() {
    return Container(
      alignment: Alignment.topLeft,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(defaultPadding + 25),
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
            labelStyle: TextStyle(
              fontSize: bodyText2,
              color: Colors.grey,
            ),
            labelText: 'Jenis Kendaraan'),
        value: typeTC,
        isExpanded: true,
        items: [
          DropdownMenuItem(
            child: Text(
              "Mobil",
              style: TextStyle(fontSize: bodyText2, color: secondaryTextColor),
            ),
            value: 'Mobil',
          ),
          DropdownMenuItem(
            child: Text(
              "Motor",
              style: TextStyle(fontSize: bodyText2, color: secondaryTextColor),
            ),
            value: 'Motor',
          ),
        ],
        onChanged: (value) {
          setState(
            () {
              typeTC = value;
            },
          );
        },
      ),
    );
  }

  Widget numberField() {
    return TextFormField(
      controller: numberTC,
      style: TextStyle(
        fontSize: bodyText2,
        color: secondaryTextColor,
      ),
      cursorColor: secondaryTextColor,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.straighten_outlined,
          color: Colors.grey,
        ),
        labelText: 'Plat No. Kendaraan',
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        hintText: 'XX-0000-YY',
        contentPadding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(defaultPadding - 5),
          vertical: getProportionateScreenHeight(12),
        ),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
        ),
      ),
      validator: validateNumber,
      onSaved: (String value) {
        number = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      controller: passTC,
      style: TextStyle(
        fontSize: bodyText2,
        color: secondaryTextColor,
      ),
      cursorColor: secondaryTextColor,
      obscureText: true,
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

  Widget confirmPasswordField() {
    return TextFormField(
      style: TextStyle(
        fontSize: bodyText2,
        color: secondaryTextColor,
      ),
      cursorColor: secondaryTextColor,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.lock_outline,
          color: Colors.grey,
        ),
        labelText: 'Konfirmasi Kata Sandi',
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        hintText: 'Isi Konfirmasi Kata Sandi',
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
      validator: validateConfirmPassword,
      onSaved: (String value) {
        confirmPassword = value;
      },
    );
  }

  Widget registerButton() {
    return ElevatedButton(
      child: Text(
        'Daftar',
        style: TextStyle(
          fontSize: bodyText2,
          color: primaryTextColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        elevation: 5,
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(142),
          vertical: getProportionateScreenHeight(17),
        ),
        shape: new RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      onPressed: registerHandler,
    );
  }

  String validateConfirmPassword(String value) {
    if (value != passTC.text) {
      return 'Isi Harus Sama Dengan Kata Sandi';
    }
    return null;
  }
}
