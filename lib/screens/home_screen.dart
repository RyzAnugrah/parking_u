import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const PrimaryColor = Color(0xFF1A659E);
  static const SecondaryColor = Color(0xFFF8CD12);
  static const ShadesColor = Color(0xFF042035);
  static const BackgroundColor = Color(0xFFFFFFFF);
  static const TextColor_1 = Color(0xFFFFFFFF);
  static const TextColor_2 = Color(0xFF08080D);
  static const ErrorColor = Color(0xFFD11313);
  static const InfoColor = Color(0xFF0569FF);
  static const SuccessColor = Color(0xFF3AC430);
  static const PendingColor = Color(0xFFFE9705);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                'Ayo cari tempat parkirmu sekarang !',
                style: TextStyle(fontSize: 23.0),
              ),
              SizedBox(height: 60),
              Image(
                image: AssetImage('assets/images/login.png'),
              ),
              SizedBox(height: 80),
              ElevatedButton(
                child: Text('Masuk'),
                style: ElevatedButton.styleFrom(
                  primary: PrimaryColor,
                  onPrimary: Colors.white,
                  shadowColor: SecondaryColor,
                  elevation: 5,
                  padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                ),
                onPressed: () {},
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum punya akun? ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  GestureDetector(
                    child: new Text(
                      'Daftar',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
