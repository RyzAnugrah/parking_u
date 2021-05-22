// import 'package:flutter/material.dart';
// import 'package:parking_u/main.dart';
// import 'package:parking_u/models/parkir_model.dart';
// import 'package:parking_u/services/parkir_service.dart';
// import 'package:sizer/sizer.dart';
// import 'package:parking_u/constants.dart';
// import 'package:parking_u/size_config.dart';

// class SearchField extends StatelessWidget {
//   const SearchField({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     void fetchSearchParkirList() async {
//       try {
//         await ParkirService.getSearchParkir(searchKeyword).then((value) {
//           if (value is List<ParkirModel>) {
//             print('Success');
//             listParkir.addAll(value);
//           }
//         });
//       } catch (e) {
//         print(e.toString());
//       }
//     }

//     return Padding(
//       padding: EdgeInsets.only(
//         left: getProportionateScreenWidth(20),
//         right: getProportionateScreenWidth(20),
//         bottom: getProportionateScreenWidth(20),
//       ),
//       child: TextField(
//         style: TextStyle(fontSize: caption.sp, color: secondaryTextColor),
//         cursorColor: secondaryTextColor,
//         onSubmitted: (value) {
//           searchKeyword = value;
//           print(searchKeyword);
//           fetchSearchParkirList();
//         },
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(
//             horizontal: getProportionateScreenWidth(10),
//             vertical: getProportionateScreenWidth(12),
//           ),
//           fillColor: Colors.white,
//           focusedBorder: OutlineInputBorder(
//             borderRadius: borderRadius,
//             borderSide: BorderSide(color: primaryColor, width: 2.0),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: borderRadius,
//           ),
//           hintText: "Cari lokasi",
//           prefixIcon: Icon(
//             Icons.search,
//             color: secondaryTextColor,
//             size: 6.0.w,
//           ),
//         ),
//       ),
//     );
//   }
// }
