import 'package:dio/dio.dart';
import 'package:parking_u/models/parkir_model.dart';
import 'package:parking_u/utils/const.dart';
import 'package:parking_u/utils/shared_prefs.dart';

class ParkirService {
  static Future getAllParkir() async {
    try {
      String token = await SharedPref.getToken();
      print(token);
      
      Response res = await Dio().get(
        '${Const.baseUrl}/parkir',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );
      print(res.data);
      List<ParkirModel> list = [];
      (res.data as List).forEach((item) {
        list.add(ParkirModel.fromJson(item));
      });
      return list;
    } catch (e) {
      print('catch error');
      print(e.toString());
    }
  }
}
