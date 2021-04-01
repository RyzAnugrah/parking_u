import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../size_config.dart';
import 'package:parking_u/mixins/validation.dart';
import 'package:parking_u/constants.dart';

class RegisterScreenPage extends StatefulWidget {
  // createState() {
  //   return RegisterScreenState();
  // }

  const RegisterScreenPage({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreenPage> with Validation {
  final formKey = GlobalKey<FormState>();

  String name = '';
  String telp = '';
  String type = '';
  String number = '';
  String password = '';
  bool valuefirst = false;
  int _value = 1;

  Widget build(context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
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
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.02),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  nameField(),
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
                  typeField(),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 1.0.h),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  numberField(),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.02),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  passwordField(),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Column(
                    children: [
                      Container(
                        padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
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
                      fontSize: caption, color: secondaryTextColor),
                ),
                GestureDetector(
                  child: new Text(
                    'Masuk',
                    style: TextStyle(
                        fontSize: caption,
                        color: secondaryTextColor,
                        fontWeight: FontWeight.w800),
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
      style: TextStyle(fontSize: bodyText2, color: secondaryTextColor),
      cursorColor: secondaryTextColor,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outline, color: Colors.grey),
        labelText: 'Nama Lengkap',
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        hintText: 'Isi Nama Lengkap',
        contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(defaultPadding - 5),
            vertical: getProportionateScreenHeight(12)),
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

  Widget telpField() {
    return TextFormField(
      style: TextStyle(fontSize: bodyText2, color: secondaryTextColor),
      cursorColor: secondaryTextColor,
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
          borderRadius: borderRadius,
          borderSide: BorderSide(color: primaryColor, width: 2.0),
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

  Widget typeField() {
    return Container(
      alignment: Alignment.topLeft,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(defaultPadding + 25),
            vertical: getProportionateScreenHeight(12)),
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: primaryColor, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
            ),
            labelStyle: TextStyle(fontSize: bodyText2, color: Colors.grey),
            labelText: 'Jenis Kendaraan'),
        value: _value,
        isExpanded: true,
        items: [
          DropdownMenuItem(
            child: Text("Mobil", style:
                          TextStyle(fontSize: bodyText2, color: secondaryTextColor),),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text("Motor", style:
                          TextStyle(fontSize: bodyText2, color: secondaryTextColor),),
            value: 2,
          ),
        ],
        onChanged: (value) {
          setState(
            () {
              _value = value;
            },
          );
        },
      ),
    );
  }

  Widget numberField() {
    return TextFormField(
      style: TextStyle(fontSize: bodyText2, color: secondaryTextColor),
      cursorColor: secondaryTextColor,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.straighten_outlined, color: Colors.grey),
        labelText: 'Plat No. Kendaraan',
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        hintText: '_ _ - _ _ _ _ - _ _',
        contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(defaultPadding - 5),
            vertical: getProportionateScreenHeight(12)),
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
      style: TextStyle(fontSize: bodyText2, color: secondaryTextColor),
      cursorColor: secondaryTextColor,
      obscureText: true,
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
          borderRadius: borderRadius,
          borderSide: BorderSide(color: primaryColor, width: 2.0),
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

  Widget registerButton() {
    return ElevatedButton(
      child: Text(
        'Daftar',
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
          print('Nama Lengkap: $name');
          print('Nomor Telepon: $telp');
          print('Tipe Kendaraan: $_value');
          print('Nomor Kendaraan: $number');
          print('Password: $password');
          print('Setuju: $valuefirst');
        }
      },
    );
  }
}
