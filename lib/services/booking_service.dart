import 'package:dio/dio.dart';
import 'package:parking_u/models/booking_model.dart';
import 'package:parking_u/utils/const.dart';
import 'package:parking_u/utils/shared_prefs.dart';

class BookingService {
  static Future createBooking(String lahanTerpilih, String tarif, String jenisPembayaran, String statusPembayaran, String waktuBooking, String nomorKendaraan, String kendaraan, String namaPengguna) async {
    Map<String, dynamic> data = {
      'lahan_terpilih': lahanTerpilih,
      'tarif': tarif,
      'jenis_pembayaran': jenisPembayaran,
      'status_pembayaran': statusPembayaran,
      'waktu_booking': waktuBooking,
      'nomor_bendaraan': nomorKendaraan,
      'kendaraan': kendaraan,
      'nama_pengguna': namaPengguna,
    };

    try {
      Response res = await Dio().post(
        '${Const.baseUrl}/booking/add',
        data: data,
      );
      print(res.data);
      SharedPref.saveToken(res.data['token']);
      return BookingModel.fromJson(res.data['booking']);
    } on DioError catch (_) {
      return 'catch error';
    }
  }
}
