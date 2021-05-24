import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:parking_u/services/booking_service.dart';
import 'package:parking_u/views/activity/activity_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:parking_u/constants.dart';
import 'package:parking_u/size_config.dart';

void displayBottomSheet(BuildContext context, riwayat) {
  SizeConfig().init(context);
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
    ),
    context: context,
    builder: (ctx) {
      return SafeArea(
        child: Container(
          height: 60.0.h,
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: Image.asset(
                      riwayat.statusPembayaran == 'PENDING'
                          ? "assets/images/list_parking/riwayat-pending.png"
                          : "assets/images/list_parking/riwayat-success.png",
                      width: 50,
                      height: getProportionateScreenHeight(180),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(defaultPadding),
                      right: getProportionateScreenWidth(defaultPadding),
                      top: getProportionateScreenHeight(defaultPadding),
                      bottom: getProportionateScreenHeight(defaultPadding - 15),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.5,
                          child: AutoSizeText(
                            riwayat.namaParkir,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: bodyText2.sp,
                              fontWeight: FontWeight.w800,
                              color: secondaryTextColor,
                            ),
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          // width: SizeConfig.screenWidth * 0.7,
                          child: Text(
                            riwayat.statusPembayaran,
                            style: TextStyle(
                              fontSize: caption.sp,
                              color: riwayat.statusPembayaran.toUpperCase() ==
                                      'PENDING'
                                  ? pendingColor
                                  : successColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(defaultPadding),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            right: 10,
                          ),
                          child: Icon(
                            Icons.gps_fixed,
                            color: secondaryTextColor,
                            size: 5.0.w,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.7,
                          child: Text(
                            'Blok ' + riwayat.lahanTerpilih,
                            maxLines: 2,
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
                  SizedBox(
                    height: getProportionateScreenHeight(5),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(defaultPadding),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            right: 10,
                          ),
                          child: Icon(
                            Icons.payments,
                            color: secondaryTextColor,
                            size: 5.0.w,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.7,
                          child: Text(
                            riwayat.jenisPembayaran,
                            maxLines: 2,
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
                  SizedBox(
                    height: getProportionateScreenHeight(5),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(defaultPadding),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            right: 10,
                          ),
                          child: Icon(
                            Icons.access_time_outlined,
                            color: secondaryTextColor,
                            size: 5.0.w,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.7,
                          child: Text(
                            riwayat.waktuBooking + ' jam',
                            style: TextStyle(
                              fontSize: caption.sp - 2,
                              color: secondaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(5),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(defaultPadding),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            right: 10,
                          ),
                          child: Icon(
                            Icons.monetization_on_outlined,
                            color: secondaryTextColor,
                            size: 5.0.w,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.7,
                          child: Text(
                            'Rp. ' + riwayat.tarif,
                            style: TextStyle(
                              fontSize: caption.sp - 2,
                              color: secondaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(5),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(defaultPadding),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            right: 10,
                          ),
                          child: Icon(
                            Icons.emoji_transportation,
                            color: secondaryTextColor,
                            size: 5.0.w,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.7,
                          child: Text(
                            riwayat.kendaraan,
                            style: TextStyle(
                              fontSize: caption.sp - 2,
                              color: secondaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(defaultPadding),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(defaultPadding),
                    ),
                    child: Column(
                      children: [
                        bookingButton(context),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(defaultPadding),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(defaultPadding),
                    ),
                    child: Column(
                      children: [
                        cancelBookingButton(context, riwayat),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(defaultPadding),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget bookingButton(context) {
  return ElevatedButton(
    child: Text(
      'Konfirmasi Pesanan',
      style: TextStyle(fontSize: caption.sp, color: secondaryTextColor),
    ),
    style: ElevatedButton.styleFrom(
      primary: secondaryColor,
      elevation: 5,
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(90),
        vertical: getProportionateScreenHeight(17),
      ),
      shape: new RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
    ),
    onPressed: () {
      // Navigator.pop(context);
      AwesomeDialog(
        context: context,
        animType: AnimType.SCALE,
        dialogType: DialogType.WARNING,
        headerAnimationLoop: false,
        dismissOnTouchOutside: false,
        dismissOnBackKeyPress: false,
        autoHide: Duration(seconds: 6),
        title: 'Konfirmasi Pemesanan Berhasil',
        desc: 'Konfirmasi Pemesanan Berhasil',
        btnOkText: 'Silahkan Tunggu Admin Untuk Mengonfirmasi',
        btnOkColor: pendingColor,
        btnOkOnPress: () {
          debugPrint('Konfirmasi Pemesanan Berhasil');
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ActivityScreen(),
            ),
          );
        },
        onDissmissCallback: () {
          debugPrint('Konfirmasi Pemesanan Berhasil');
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ActivityScreen(),
            ),
          );
        },
      )..show();
    },
  );
}

Widget cancelBookingButton(context, riwayat) {
  void onCancelBookingHandler() async {
    await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Anda yakin?'),
        content: new Text('Ingin batalkan pesanan ini'),
        actions: <Widget>[
          new TextButton(
            child: new Text(
              'Tidak',
              style: TextStyle(color: secondaryTextColor),
            ),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          new TextButton(
            child: new Text(
              'Ya',
              style: TextStyle(color: primaryColor),
            ),
            onPressed: () async {
              try {
                await BookingService.cancelBooking(
                  riwayat.id.toString(),
                ).then(
                  (value) {
                    if (value == '1') {
                      print('Berhasil Batalkan Pesanan');
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.SCALE,
                        dialogType: DialogType.SUCCES,
                        headerAnimationLoop: false,
                        dismissOnTouchOutside: false,
                        dismissOnBackKeyPress: false,
                        autoHide: Duration(seconds: 6),
                        title: 'Berhasil Batalkan Pesanan',
                        desc: 'Anda Berhasil Batalkan Pesanan',
                        btnOkText: 'Oke',
                        btnOkOnPress: () {
                          debugPrint('Berhasil Batalkan Pesanan');
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => ActivityScreen(),
                            ),
                          );
                        },
                        onDissmissCallback: () {
                          debugPrint('Berhasil Batalkan Pesanan');
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => ActivityScreen(),
                            ),
                          );
                        },
                      )..show();
                    } else {
                      print('Gagal Batalkan Pesanan');
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.SCALE,
                        dialogType: DialogType.ERROR,
                        headerAnimationLoop: false,
                        dismissOnTouchOutside: false,
                        dismissOnBackKeyPress: false,
                        autoHide: Duration(seconds: 6),
                        title: 'Gagal Batalkan Pesanan',
                        desc: 'Anda Gagal Batalkan Pesanan',
                        btnOkText: 'Cek Pesanan Anda',
                        btnOkColor: errorColor,
                        btnOkOnPress: () {
                          debugPrint('Gagal Batalkan Pesanan');
                        },
                        onDissmissCallback: () {
                          debugPrint('Gagal Batalkan Pesanan');
                        },
                      )..show();
                    }
                  },
                );
              } catch (e) {
                print('catch error');
                print(e.toString());
              }
            },
          ),
        ],
      ),
    );
  }

  return ElevatedButton(
    child: Text(
      'Batalkan Pesanan',
      style: TextStyle(fontSize: caption.sp, color: secondaryTextColor),
    ),
    style: ElevatedButton.styleFrom(
      primary: errorColor,
      elevation: 5,
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(90),
        vertical: getProportionateScreenHeight(17),
      ),
      shape: new RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
    ),
    onPressed: onCancelBookingHandler,
    // onPressed: () {
    // Navigator.pop(context);
    // AwesomeDialog(
    //   context: context,
    //   animType: AnimType.SCALE,
    //   dialogType: DialogType.WARNING,
    //   headerAnimationLoop: false,
    //   dismissOnTouchOutside: false,
    //   dismissOnBackKeyPress: false,
    //   autoHide: Duration(seconds: 6),
    //   title: 'Konfirmasi Pemesanan Berhasil',
    //   desc: 'Konfirmasi Pemesanan Berhasil',
    //   btnOkText: 'Silahkan Tunggu Admin Untuk Mengonfirmasi',
    //   btnOkColor: pendingColor,
    //   btnOkOnPress: () {
    //     debugPrint('Konfirmasi Pemesanan Berhasil');
    //   },
    //   onDissmissCallback: () {
    //     debugPrint('Konfirmasi Pemesanan Berhasil');
    //   },
    // )..show();
    // },
  );
}
