import 'package:flutter/material.dart';
import 'package:parking_u/constants.dart';

import 'package:parking_u/views/home/home_screen.dart';
import 'package:parking_u/views/profile/profile_screen.dart';
import 'package:parking_u/enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0),
      decoration: BoxDecoration(
        color: primaryBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -1),
            blurRadius: 10,
            color: Color(0xFFDADADA).withOpacity(0.5),
          ),
        ],
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.home_outlined),
                    color: MenuState.home == selectedMenu
                        ? primaryColor
                        : inActiveIconColor,
                    onPressed: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => HomeScreen()),
                    ),
                  ),
                  Text(
                    'Beranda',
                    style: TextStyle(
                      color: MenuState.home == selectedMenu
                          ? primaryColor
                          : inActiveIconColor,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.list_alt_outlined),
                    color: MenuState.activity == selectedMenu
                        ? primaryColor
                        : inActiveIconColor,
                    onPressed: () => {},
                  ),
                  Text(
                    'Aktivitas',
                    style: TextStyle(
                      color: MenuState.activity == selectedMenu
                          ? primaryColor
                          : inActiveIconColor,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.person_outline),
                    color: MenuState.profile == selectedMenu
                        ? primaryColor
                        : inActiveIconColor,
                    onPressed: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => ProfileScreen()),
                    ),
                  ),
                  Text(
                    'Akun',
                    style: TextStyle(
                      color: MenuState.profile == selectedMenu
                          ? primaryColor
                          : inActiveIconColor,
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
