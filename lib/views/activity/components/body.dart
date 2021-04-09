import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';
import 'list_activity.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: defaultPadding),
        child: Column(
          children: [
            ListActivity(),
          ],
        )
      ),
    );
  }
}
