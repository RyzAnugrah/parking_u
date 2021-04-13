import 'package:flutter/material.dart';
import 'package:parking_u/constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    @required this.text,
    @required this.icon,
    this.press,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              color: secondaryTextColor,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: secondaryTextColor),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: secondaryTextColor),
          ],
        ),
      ),
    );
  }
}
