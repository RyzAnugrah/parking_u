import 'package:flutter/material.dart';
import 'package:parking_u/mixins/validation.dart';
import 'package:parking_u/styles/color_style.dart';
import 'package:parking_u/styles/font_style.dart';
import 'package:sizer/sizer.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.all(10.0.w),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Daftar',
                  style: headlineGreet,
                ),
              ],
            ),
            SizedBox(height: 5.0.h),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 2.0.h),
                    child: Text(
                      'Nama Lengkap',
                      style: headlineInfo,
                    ),
                  ),
                  nameField(),
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
                      'Jenis Kendaraan',
                      style: headlineInfo,
                    ),
                  ),
                  typeField(),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 2.0.h),
                    child: Text(
                      'Nomor Kendaraan',
                      style: headlineInfo,
                    ),
                  ),
                  numberField(),
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
                  Row(
                    children: [
                      Checkbox(
                        value: this.valuefirst,
                        onChanged: (bool value) {
                          setState(() {
                            this.valuefirst = value;
                          });
                        },
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'dengan ini anda menyetujui kebijakan',
                                style: textBreadCrumb,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                softWrap: false,
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'dan privasi pengguna',
                                style: textBreadCrumb,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.0.h),
                  registerButton(),
                ],
              ),
            ),
            SizedBox(height: 2.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah punya akun? ',
                  style: headlineInfo,
                ),
                GestureDetector(
                  child: new Text(
                    'Masuk',
                    style: headlineInfoBold,
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
      decoration: InputDecoration(
        hintText: 'Isi Nama Lengkap',
        border: OutlineInputBorder(),
      ),
      validator: validateName,
      onSaved: (String value) {
        name = value;
      },
    );
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

  Widget typeField() {
    return Container(
      alignment: Alignment.topLeft,
      child: DropdownButton(
        value: _value,
        items: [
          DropdownMenuItem(
            child: Text("Mobil"),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text("Motor"),
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
      decoration: InputDecoration(
        hintText: '_ _ - _ _ _ _ - _ _',
        border: OutlineInputBorder(),
      ),
      validator: validateNumber,
      onSaved: (String value) {
        number = value;
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

  Widget registerButton() {
    return ElevatedButton(
      child: Text('Daftar'),
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
