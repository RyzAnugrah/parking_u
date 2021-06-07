import 'package:dio/dio.dart';
import 'package:parking_u/models/riwayat_model.dart';
import 'package:parking_u/utils/const.dart';
import 'package:parking_u/utils/shared_prefs.dart';

class RiwayatService {
  static Future getSpecifiedRiwayat(String email) async {
    try {
      String token = await SharedPref.getToken();
      print(token);
      
      Response res = await Dio().get(
        '${Const.baseUrl}/riwayat/$email',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );
      print(res.data[0]);
      List<RiwayatModel> list = [];
      (res.data[0] as List).forEach((item) {
        list.add(RiwayatModel.fromJson(item));
      });
      return list;
    } catch (e) {
      print('catch error');
      print(e.toString());
    }
  }
}
