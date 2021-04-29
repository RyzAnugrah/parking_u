import 'package:flutter/material.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/enums.dart';
import 'package:parking_u/models/parkir_model.dart';
import 'package:parking_u/services/parkir_service.dart';
import 'package:parking_u/components/custom_bottom_nav_bar.dart';
import 'package:parking_u/views/home/components/body.dart';
// import 'package:parking_u/views/home/components/list_park.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  final String token;
  const HomeScreen({Key key, this.token}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ParkirModel> listParkir = [];

  void fetchParkirList() async {
    try {
      await ParkirService.getAllParkir().then((value) {
        if (value is List<ParkirModel>) {
          print('Success');
          listParkir.addAll(value);
          setState(() {});
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    fetchParkirList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      // body: ListView.builder(
      //   itemCount: listParkir.length,
      //   itemBuilder: (context, index) {
      //     ParkirModel item = listParkir[index];
      //     return ListPark(
      //       item: item,
      //     );
      //   },
      // ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
