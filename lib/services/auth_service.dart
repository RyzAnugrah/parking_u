import 'package:dio/dio.dart';
import 'package:parking_u/models/auth_model.dart';
import 'package:parking_u/utils/const.dart';
import 'package:parking_u/utils/shared_prefs.dart';

class AuthService {
  static Future login(String email, String password) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };

    try {
      Response res = await Dio().post(
        '${Const.baseUrl}/login',
        data: data,
      );
      print(res.data);
      SharedPref.saveToken(res.data['token']);
      return UserModel.fromJson(res.data['user']);
    } on DioError catch (_) {
      return 'catch error';
    }
  }

  static Future register(String namaLengkap, String email, String nopol,
      String jenisKendaraan, String password) async {
    Map<String, dynamic> data = {
      'nama_lengkap': namaLengkap,
      'email': email,
      'nopol': nopol,
      'jenis_kendaraan': jenisKendaraan,
      'password': password,
    };

    try {
      Response res = await Dio().post(
        '${Const.baseUrl}/register',
        data: data,
      );
      print(res.data);
      return UserModel.fromJson(res.data['user']);
    } on DioError catch (_) {
      print('catch error');
    }
  }

  static Future edit(String namaLengkap, String email, String nopol,
      String jenisKendaraan, String password, String userID) async {
    Map<String, dynamic> data = {
      'nama_lengkap': namaLengkap,
      'email': email,
      'nopol': nopol,
      'jenis_kendaraan': jenisKendaraan,
      'password': password,
    };

    try {
      String token = await SharedPref.getToken();
      print(token);

      Response res = await Dio().put(
        '${Const.baseUrl}/user/$userID',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
          contentType: Headers.formUrlEncodedContentType
        ),
      );
      print(res.data);
      return UserModel.fromJson(res.data['User']);
    } on DioError catch (_) {
      print('catch error');
    }
  }
}
