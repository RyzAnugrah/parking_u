import 'package:dio/dio.dart';
import 'package:parking_u/models/booking_model.dart';
import 'package:parking_u/utils/const.dart';
import 'package:parking_u/utils/shared_prefs.dart';

class BookingService {
  static Future createBooking(
      String lahanTerpilih,
      String tarif,
      String jenisPembayaran,
      String statusPembayaran,
      String waktuBooking,
      String nomorKendaraan,
      String kendaraan,
      String namaPengguna,
      String email,
      String namaParkir) async {
    Map<String, dynamic> data = {
      'lahan_terpilih': lahanTerpilih,
      'tarif': tarif,
      'jenis_pembayaran': jenisPembayaran,
      'status_pembayaran': statusPembayaran,
      'waktu_booking': waktuBooking,
      'nomor_kendaraan': nomorKendaraan,
      'kendaraan': kendaraan,
      'nama_pengguna': namaPengguna,
      'email': email,
      'nama_parkir': namaParkir,
    };

    try {
      String token = await SharedPref.getToken();
      print(token);

      Response res = await Dio().post(
        '${Const.baseUrl}/booking/add',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );
      print(res.data);
      return BookingModel.fromJson(res.data['booking']);
    } on DioError catch (_) {
      return 'catch error';
    }
  }

  static Future cancelBooking(String riwayatID) async {
    try {
      String token = await SharedPref.getToken();
      print(token);
      
      Response res = await Dio().delete(
        '${Const.baseUrl}/booking/$riwayatID',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );
      print(res.data);
      return (res.data);
    } catch (e) {
      print('catch error');
      print(e.toString());
    }
  }
}
