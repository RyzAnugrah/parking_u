import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/enums.dart';
import 'package:parking_u/size_config.dart';
import 'package:parking_u/views/home/home_screen.dart';
import 'package:parking_u/views/profile/profile_screen.dart';
import 'package:parking_u/views/activity/activity_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return SafeArea(
      child: Container(
        height: 8.0.h,
        padding: EdgeInsets.only(right: defaultPadding),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => HomeScreen(),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: MenuState.home == selectedMenu
                            ? primaryColor
                            : inActiveIconColor,
                        size: 8.0.w,
                      ),
                      Text(
                        'Beranda',
                        style: TextStyle(
                          color: MenuState.home == selectedMenu
                              ? primaryColor
                              : inActiveIconColor,
                          fontSize: 10.0.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => ActivityScreen(),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.list_alt_outlined,
                      color: MenuState.activity == selectedMenu
                          ? primaryColor
                          : inActiveIconColor,
                      size: 8.0.w,
                    ),
                    Text(
                      'Riwayat',
                      style: TextStyle(
                        color: MenuState.activity == selectedMenu
                            ? primaryColor
                            : inActiveIconColor,
                        fontSize: 10.0.sp,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => ProfileScreen(),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: MenuState.profile == selectedMenu
                          ? primaryColor
                          : inActiveIconColor,
                      size: 8.0.w,
                    ),
                    Text(
                      'Akun',
                      style: TextStyle(
                        color: MenuState.profile == selectedMenu
                            ? primaryColor
                            : inActiveIconColor,
                        fontSize: 10.0.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
