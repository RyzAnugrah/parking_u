import 'package:flutter/material.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';
import 'package:parking_u/views/activity/components/list_activity.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: defaultPadding),
        child: Column(
          children: [
            ListActivity(),
          ],
        ),
      ),
    );
  }
}
