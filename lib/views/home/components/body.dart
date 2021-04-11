import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../../constants.dart';
import 'search.dart';
import 'header.dart';
import 'filter.dart';
import 'list_park.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              // pinned: true,
              snap: true,
              elevation: 50,
              backgroundColor: Colors.transparent,
              expandedHeight: getProportionateScreenHeight(140),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(defaultPadding + 10),
                        bottomRight: Radius.circular(defaultPadding + 10),
                      )),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Header(),
                              // SizedBox(height: 15),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    padding: EdgeInsets.only(
                      top: size.height * 0.04,
                      bottom: size.height * 0.03,
                    ),
                    decoration: BoxDecoration(
                        color: primaryBackgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(defaultPadding + 10),
                          topRight: Radius.circular(defaultPadding + 10),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SearchField(),
                        Filter(),
                        ListPark(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
