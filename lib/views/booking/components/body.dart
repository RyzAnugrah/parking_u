import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:parking_u/main.dart';
import 'package:parking_u/mixins/validation.dart';
import 'package:parking_u/models/booking_model.dart';
import 'package:parking_u/models/parkir_model.dart';
import 'package:parking_u/services/booking_service.dart';
import 'package:parking_u/views/activity/activity_screen.dart';
import 'package:sizer/sizer.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';
import 'package:parking_u/views/booking/components/booking_details.dart';
import 'package:parking_u/views/booking/components/payment.dart';
// import 'package:parking_u/views/booking/components/time_list.dart';
// import 'package:parking_u/views/home/home_screen.dart';

class Body extends StatefulWidget {
  final ParkirModel item;

  const Body({Key key, this.item}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with Validation {
  final formKey = GlobalKey<FormState>();

  String lahan = '';
  String tarifTC = '500';
  String jenisPembayaran = 'CASH';
  String statusPembayaran = 'PENDING';
  String timeTC = '1';
  String number = user.nopol;
  String typeTC = user.jenisKendaraan;
  String namaPengguna = user.namaLengkap;
  String email = user.email;
  String namaParkir = '';

  TextEditingController lahanTC = TextEditingController();
  TextEditingController numberTC = TextEditingController();
  TextEditingController nameTC = TextEditingController();

  void checkoutHandler() async {
    log(lahanTC.text);
    log(tarifTC);
    log(jenisPembayaran);
    log(statusPembayaran);
    log(timeTC);
    log(number);
    log(typeTC);
    log(namaPengguna);
    log(email);
    log(namaParkir);
    try {
      await BookingService.createBooking(
        lahanTC.text,
        tarifTC,
        jenisPembayaran,
        statusPembayaran,
        timeTC,
        number,
        typeTC,
        namaPengguna,
        email,
        namaParkir,
      ).then(
        (value) {
          if (value is BookingModel) {
            print('Berhasil Booking');
            AwesomeDialog(
              context: context,
              animType: AnimType.SCALE,
              dialogType: DialogType.SUCCES,
              headerAnimationLoop: false,
              dismissOnTouchOutside: false,
              dismissOnBackKeyPress: false,
              autoHide: Duration(seconds: 6),
              title: 'Berhasil Booking',
              desc: 'Anda Berhasil Booking',
              btnOkText: 'Oke',
              btnOkOnPress: () {
                debugPrint('Berhasil Booking');
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) {
                      return ActivityScreen();
                    },
                  ),
                );
              },
              onDissmissCallback: () {
                debugPrint('Berhasil Booking');
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) {
                      return ActivityScreen();
                    },
                  ),
                );
              },
            )..show();
          } else {
            print('Test ' + value);
            print('Gagal Booking');
            AwesomeDialog(
              context: context,
              animType: AnimType.SCALE,
              dialogType: DialogType.ERROR,
              headerAnimationLoop: false,
              dismissOnTouchOutside: false,
              dismissOnBackKeyPress: false,
              autoHide: Duration(seconds: 6),
              title: 'Gagal Booking',
              desc: 'Anda Gagal Booking',
              btnOkText: 'Isi Data Dengan Benar',
              btnOkColor: errorColor,
              btnOkOnPress: () {
                debugPrint('Gagal Booking');
              },
              onDissmissCallback: () {
                debugPrint('Gagal Booking');
              },
            )..show();
          }
        },
      );
    } catch (e) {
      print('catch error');
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    setState(() {
      namaParkir = widget.item.namaParkir;
    });
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(defaultPadding),
        horizontal: getProportionateScreenWidth(defaultPadding),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(defaultPadding * 0.1),
              right: getProportionateScreenWidth(defaultPadding * 0.1),
            ),
            child: SizedBox(
              width: SizeConfig.screenWidth * 0.9,
              child: Text(
                widget.item.namaParkir,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: headline6.sp,
                  color: secondaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Container(
            child: SizedBox(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      right: 5,
                    ),
                    child: Icon(
                      Icons.gps_fixed,
                      size: 4.0.w,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.7,
                    child: Text(
                      widget.item.lokasiParkir,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: caption.sp - 2,
                        color: secondaryTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(defaultPadding),
          ),
          Container(
            child: SizedBox(
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return BookingDetails(item: widget.item);
                          },
                        ),
                      ),
                    },
                    child: Text(
                      ("Lihat Lahan Parkir"),
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: caption.sp - 1,
                          color: primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: SizedBox(
              child: Row(
                children: [
                  Column(
                    children: <Widget>[
                      Text(
                        "Lahan Tersedia: " +
                            widget.item.lahanTersedia.toString() +
                            " / " +
                            widget.item.totalLahan.toString(),
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: caption.sp - 2,
                          color: secondaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: SizedBox(
              child: Row(
                children: [
                  Column(
                    children: <Widget>[
                      Text(
                        "Lahan Tidak Tersedia: " +
                            widget.item.lahanTidakTersedia.toString() +
                            " / " +
                            widget.item.totalLahan.toString(),
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: caption.sp - 2,
                          color: secondaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: SizedBox(
              child: Row(
                children: [
                  Column(
                    children: <Widget>[
                      Text(
                        "Waktu Buka: " + widget.item.jam,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: caption.sp - 2,
                          color: secondaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          // Container(
          //   child: SizedBox(
          //     child: Row(
          //       children: [
          //         Column(
          //           children: <Widget>[
          //             Text(
          //               ("Pilih Waktu"),
          //               maxLines: 2,
          //               style: TextStyle(
          //                 fontSize: caption.sp - 1,
          //                 color: secondaryTextColor,
          //                 fontWeight: FontWeight.w700,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // TimeList(item: widget.item),
          // Divider(),
          SizedBox(
            height: getProportionateScreenHeight(defaultPadding),
          ),
          Container(
            child: SizedBox(
              child: Row(
                children: [
                  Column(
                    children: <Widget>[
                      Text(
                        "Isi Data Pesanan",
                        style: TextStyle(
                          fontSize: caption.sp - 2,
                          color: secondaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          lahanField(),
          SizedBox(
            height: getProportionateScreenHeight(defaultPadding),
          ),
          // timeField(),
          // SizedBox(
          //   height: getProportionateScreenHeight(defaultPadding),
          // ),
          tarifField(),
          SizedBox(
            height: getProportionateScreenHeight(defaultPadding),
          ),
          // numberField(),
          // SizedBox(
          //   height: getProportionateScreenHeight(defaultPadding),
          // ),
          // typeField(),
          // SizedBox(
          //   height: getProportionateScreenHeight(defaultPadding),
          // ),
          // nameField(),
          // SizedBox(
          //   height: getProportionateScreenHeight(defaultPadding),
          // ),
          Payment(item: widget.item),
          SizedBox(
            height: getProportionateScreenHeight(defaultPadding),
          ),
          bookingButton(context),
        ],
      ),
    );
  }

  Widget lahanField() {
    return TextFormField(
      controller: lahanTC,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: bodyText2,
        color: secondaryTextColor,
      ),
      cursorColor: secondaryTextColor,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.map_sharp,
          color: Colors.grey,
        ),
        labelText: 'Nomor Lahan Parkir',
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        hintText: 'Isi Nomor Lahan Parkir',
        contentPadding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(defaultPadding - 5),
          vertical: getProportionateScreenHeight(12),
        ),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: primaryColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
        ),
      ),
      // validator: validateName,
      onSaved: (String value) {
        lahan = value;
      },
    );
  }

  Widget tarifField() {
    return Container(
      alignment: Alignment.topLeft,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(defaultPadding + 25),
              vertical: getProportionateScreenHeight(12),
            ),
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(
                color: primaryColor,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
            ),
            labelStyle: TextStyle(
              fontSize: bodyText2,
              color: Colors.grey,
            ),
            labelText: 'Pilih Waktu - Tarif'),
        value: tarifTC,
        isExpanded: true,
        items: [
          DropdownMenuItem(
            child: Text(
              'Pilih Waktu dan Tarif',
              style: TextStyle(fontSize: bodyText2, color: secondaryTextColor),
            ),
            value: "500",
          ),
          DropdownMenuItem(
            child: Text(
              (widget.item.tarif1 != null)
                  ? "1 jam - Rp. " + widget.item.tarif1.toString()
                  : "1 jam - Rp. 3000",
              style: TextStyle(fontSize: bodyText2, color: secondaryTextColor),
            ),
            value: widget.item.tarif1.toString(),
          ),
          DropdownMenuItem(
            child: Text(
              (widget.item.tarif2 != null)
                  ? "2 jam - Rp. " + widget.item.tarif2.toString()
                  : "2 jam - Rp. 5000",
              style: TextStyle(fontSize: bodyText2, color: secondaryTextColor),
            ),
            value: widget.item.tarif2.toString(),
          ),
          DropdownMenuItem(
            child: Text(
              (widget.item.tarif3 != null)
                  ? "3 jam - Rp. " + widget.item.tarif3.toString()
                  : "3 jam - Rp. 7000",
              style: TextStyle(fontSize: bodyText2, color: secondaryTextColor),
            ),
            value: widget.item.tarif3.toString(),
          ),
        ],
        onChanged: (value) {
          setState(
            () {
              tarifTC = value;

              if (tarifTC == '500') {
                timeTC = '1';
              } else if (tarifTC == widget.item.tarif1.toString()) {
                timeTC = '1';
              } else if (tarifTC == widget.item.tarif2.toString()) {
                timeTC = '2';
              } else {
                timeTC = '3';
              }
            },
          );
        },
      ),
    );
  }

  // Widget timeField() {
  //   return TextFormField(
  //     controller: timeTC,
  //     keyboardType: TextInputType.number,
  //     style: TextStyle(
  //       fontSize: bodyText2,
  //       color: secondaryTextColor,
  //     ),
  //     cursorColor: secondaryTextColor,
  //     decoration: InputDecoration(
  //       prefixIcon: Icon(
  //         Icons.timer,
  //         color: Colors.grey,
  //       ),
  //       labelText: 'Waktu Booking',
  //       labelStyle: TextStyle(
  //         color: Colors.grey,
  //       ),
  //       hintText: '09.00 - 10.00',
  //       contentPadding: EdgeInsets.symmetric(
  //         horizontal: getProportionateScreenWidth(defaultPadding - 5),
  //         vertical: getProportionateScreenHeight(12),
  //       ),
  //       fillColor: Colors.white,
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: borderRadius,
  //         borderSide: BorderSide(color: primaryColor, width: 2.0),
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: borderRadius,
  //       ),
  //     ),
  //     // validator: validateName,
  //     onSaved: (String value) {
  //       time = value;
  //     },
  //   );
  // }

  Widget numberField() {
    return TextFormField(
      controller: numberTC,
      style: TextStyle(
        fontSize: bodyText2,
        color: secondaryTextColor,
      ),
      cursorColor: secondaryTextColor,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.straighten_outlined,
          color: Colors.grey,
        ),
        labelText: 'Konfirmasi Plat No. Kendaraan',
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        hintText: 'XX-0000-YY',
        contentPadding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(defaultPadding - 5),
          vertical: getProportionateScreenHeight(12),
        ),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
        ),
      ),
      validator: validateNumber,
      onSaved: (String value) {
        number = value;
      },
    );
  }

  Widget typeField() {
    return Container(
      alignment: Alignment.topLeft,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(defaultPadding + 25),
              vertical: getProportionateScreenHeight(12),
            ),
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(
                color: primaryColor,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
            ),
            labelStyle: TextStyle(
              fontSize: bodyText2,
              color: Colors.grey,
            ),
            labelText: 'Jenis Kendaraan'),
        value: typeTC,
        isExpanded: true,
        items: [
          DropdownMenuItem(
            child: Text(
              "Mobil",
              style: TextStyle(fontSize: bodyText2, color: secondaryTextColor),
            ),
            value: 'Mobil',
          ),
          DropdownMenuItem(
            child: Text(
              "Motor",
              style: TextStyle(fontSize: bodyText2, color: secondaryTextColor),
            ),
            value: 'Motor',
          ),
        ],
        onChanged: (value) {
          setState(
            () {
              typeTC = value;
            },
          );
        },
      ),
    );
  }

  Widget nameField() {
    return TextFormField(
      controller: nameTC,
      style: TextStyle(
        fontSize: bodyText2,
        color: secondaryTextColor,
      ),
      cursorColor: secondaryTextColor,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person_outline,
          color: Colors.grey,
        ),
        labelText: 'Nama Lengkap',
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        hintText: 'Isi Nama Lengkap',
        contentPadding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(defaultPadding - 5),
          vertical: getProportionateScreenHeight(12),
        ),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: primaryColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
        ),
      ),
      validator: validateName,
      onSaved: (String value) {
        namaPengguna = value;
      },
    );
  }

  Widget bookingButton(BuildContext context) {
    return ElevatedButton(
      child: Text(
        'Checkout',
        style: TextStyle(
          fontSize: bodyText1.sp,
          color: secondaryTextColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: secondaryColor,
        elevation: 5,
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(120),
          vertical: getProportionateScreenHeight(17),
        ),
        shape: new RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      onPressed: checkoutHandler,
      // onPressed: () {
      //   AwesomeDialog(
      //       context: context,
      //       animType: AnimType.SCALE,
      //       headerAnimationLoop: false,
      //       dialogType: DialogType.SUCCES,
      //       title: 'Checkout Berhasil',
      //       desc: 'Lakukan Validasi Pesanan di Tempat Masuk Parkir',
      //       btnOkOnPress: () {
      //         debugPrint('Success');
      //         Navigator.of(context).pushReplacement(
      //           MaterialPageRoute(builder: (_) {
      //             return HomeScreen();
      //           }),
      //         );
      //       },
      //       btnOkIcon: Icons.check_circle,
      //       onDissmissCallback: () {
      //         debugPrint('Dialog Dissmiss from callback');
      //         Navigator.of(context).pushReplacement(
      //           MaterialPageRoute(builder: (_) {
      //             return HomeScreen();
      //           }),
      //         );
      //       })
      //     ..show();
      // },
    );
  }
}
