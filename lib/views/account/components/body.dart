import 'package:flutter/material.dart';
import 'package:parking_u/views/profile/components/profile_pic.dart';
// import 'package:sizer/sizer.dart';

import 'package:parking_u/mixins/validation.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';

class Body extends StatefulWidget {
  // createState() {
  //   return BodyState();
  // }

  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with Validation {
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
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: ProfilePic(),
            ),
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
              padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.01),
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
            registerButton(),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            
          ],
        ),
      ),
    );
  }

  Widget nameField() {
    return TextFormField(
      style: TextStyle(fontSize: bodyText1, color: secondaryTextColor),
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

  Widget telpField() {
    return TextFormField(
      style: TextStyle(fontSize: bodyText1, color: secondaryTextColor),
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
                ),
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: primaryColor, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
            ),
            labelStyle: TextStyle(fontSize: bodyText1, color: Colors.grey),
            labelText: 'Jenis Kendaraan'),
        value: _value,
        isExpanded: true,
        items: [
          DropdownMenuItem(
            child: Text(
              "Mobil",
              style:
                  TextStyle(fontSize: bodyText1, color: secondaryTextColor),
            ),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text(
              "Motor",
              style:
                  TextStyle(fontSize: bodyText1, color: secondaryTextColor),
            ),
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
      style: TextStyle(fontSize: bodyText1, color: secondaryTextColor),
      cursorColor: secondaryTextColor,
      decoration: InputDecoration(
        prefixIcon:
            Icon(Icons.straighten_outlined, color: Colors.grey),
        labelText: 'Plat No. Kendaraan',
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        hintText: '_ _ - _ _ _ _ - _ _',
        contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(defaultPadding - 5),
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
      style: TextStyle(fontSize: bodyText1, color: secondaryTextColor),
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
      validator: validatePassword,
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget registerButton() {
    return ElevatedButton(
      child: Text(
        'Edit',
        style: TextStyle(fontSize: bodyText1, color: primaryTextColor),
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
