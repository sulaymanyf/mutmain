import 'package:dio/dio.dart';

class PrayerTimeApi {
  static String quranUrl = 'https://quran.com/api/api/v3/chapters/';
  static const CONTENT_TYPE_JSON = "application/json";

  static Future<List> getQuranTitle() async {
    Dio  dio =  new   Dio();
    try {
      print("getQuranTitle11");
      Response response =
          await dio.get('https://quran.com/api/api/v3/chapters/');
      print("getQuranTitle22");
      print("get ====== "+response.statusCode.toString());
      if (response.statusCode == 200) {
        return response.data['chapters'];
      } else {
        print('A network error occurred');
      }
    } catch (e) {
      print(e);
    }
  }
  //https://quran.com/api/api/v3/chapters/1/verses?&translations=56

  static Future<List> getQuran(id) async {
    try {
      print("sssssss");
      print(id);
      Map paras = {"translations":"56"};
      Dio  dio =  new   Dio();
      Response response =
      await dio.get('https://quran.com/api/api/v3/chapters/'+id.toString()+"/verses?offset=0&limit=30&translations=56");
      print('https://quran.com/api/api/v3/chapters/'+id.toString()+"/verses?translations=56");
      print(response.request);
      if (response.statusCode == 200) {
        print(response);
        print(response.data['verses']);
        return response.data['verses'];
      } else {
        print('A network error occurred');
      }
    } catch (e) {
      print(e);
    }
  }
}
