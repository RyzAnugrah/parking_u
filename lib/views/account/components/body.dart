import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/mixins/validation.dart';
import 'package:parking_u/size_config.dart';
import 'package:parking_u/main.dart';
import 'package:parking_u/models/auth_model.dart';
import 'package:parking_u/services/auth_service.dart';
import 'package:parking_u/utils/shared_prefs.dart';
import 'package:parking_u/views/login/login_screen.dart';
import 'package:parking_u/views/profile/components/profile_pic.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with Validation {
  final formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String number = '';
  String typeTC = '';
  String password = '';
  String confirmPassword = '';

  TextEditingController nameTC = TextEditingController();
  TextEditingController emailTC = TextEditingController();
  TextEditingController numberTC = TextEditingController();
  TextEditingController passTC = TextEditingController();

  setup() {
    nameTC = TextEditingController(text: user.namaLengkap);
    emailTC = TextEditingController(text: user.email);
    numberTC = TextEditingController(text: user.nopol);
    typeTC = user.jenisKendaraan;
  }

  @override
  void initState() {
    super.initState();
    setup();
  }

  void editHandler() async {
    log(nameTC.text);
    log(emailTC.text);
    log(numberTC.text);
    log(typeTC);
    log(passTC.text);
    try {
      if (formKey.currentState.validate()) {
        formKey.currentState.save();
        await AuthService.edit(
          nameTC.text,
          emailTC.text,
          numberTC.text,
          typeTC,
          passTC.text,
          user.id.toString(),
        ).then(
          (value) {
            if (value is UserModel) {
              print('Berhasil Edit');
              AwesomeDialog(
                context: context,
                animType: AnimType.SCALE,
                dialogType: DialogType.SUCCES,
                headerAnimationLoop: false,
                dismissOnTouchOutside: false,
                dismissOnBackKeyPress: false,
                autoHide: Duration(seconds: 6),
                title: 'Berhasil Edit',
                desc: 'Anda Berhasil Edit',
                btnOkText: 'Silahkan Login Kembali',
                btnOkOnPress: () {
                  debugPrint('Berhasil Edit');
                  SharedPref.removeToken();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                onDissmissCallback: () {
                  debugPrint('Berhasil Edit');
                  SharedPref.removeToken();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              )..show();
            } else {
              print('Gagal Edit');
              AwesomeDialog(
                context: context,
                animType: AnimType.SCALE,
                dialogType: DialogType.ERROR,
                headerAnimationLoop: false,
                dismissOnTouchOutside: false,
                dismissOnBackKeyPress: false,
                autoHide: Duration(seconds: 6),
                title: 'Gagal Edit',
                desc: 'Anda Gagal Edit',
                btnOkText: 'Isi Form Dengan Benar',
                btnOkColor: errorColor,
                btnOkOnPress: () {
                  debugPrint('Gagal Edit');
                },
                onDissmissCallback: () {
                  debugPrint('Gagal Edit');
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
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding,
      ),
      child: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
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
              emailField(),
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
              confirmPasswordField(),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              editButton(),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Widget nameField() {
    return TextFormField(
      controller: nameTC,
      style: TextStyle(
        fontSize: bodyText1,
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
      validator: validateName,
      onSaved: (String value) {
        name = value;
      },
    );
  }

  Widget emailField() {
    return TextFormField(
      controller: emailTC,
      style: TextStyle(
        fontSize: bodyText1,
        color: secondaryTextColor,
      ),
      cursorColor: secondaryTextColor,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.email_outlined,
          color: Colors.grey,
        ),
        labelText: 'Email',
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        hintText: 'Isi Email',
        contentPadding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(defaultPadding - 5),
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
            fontSize: bodyText1,
            color: Colors.grey,
          ),
          labelText: 'Jenis Kendaraan',
        ),
        value: typeTC,
        isExpanded: true,
        items: [
          DropdownMenuItem(
            child: Text(
              "Mobil",
              style: TextStyle(fontSize: bodyText1, color: secondaryTextColor),
            ),
            value: 'Mobil',
          ),
          DropdownMenuItem(
            child: Text(
              "Motor",
              style: TextStyle(fontSize: bodyText1, color: secondaryTextColor),
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
        fontSize: bodyText1,
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
      controller: passTC,
      style: TextStyle(
        fontSize: bodyText1,
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
        fontSize: bodyText1,
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

  Widget editButton() {
    return ElevatedButton(
      child: Text(
        'Edit',
        style: TextStyle(
          fontSize: bodyText1,
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
      onPressed: editHandler,
    );
  }

  String validateConfirmPassword(String value) {
    if (value != passTC.text) {
      return 'Isi Harus Sama Dengan Kata Sandi';
    }
    return null;
  }
}
