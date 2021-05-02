import 'package:flutter/material.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';
// import 'package:parking_u/models/parkir_model.dart';
import 'package:parking_u/views/home/components/filter.dart';
import 'package:parking_u/views/home/components/header.dart';
import 'package:parking_u/views/home/components/list_park.dart';
import 'package:parking_u/views/home/components/search.dart';

class Body extends StatelessWidget {
  // final ParkirModel item;
  // const Body({Key key, this.item}) : super(key: key);
  
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
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Header(),
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
                      ),
                    ),
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
