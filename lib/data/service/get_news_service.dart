import 'package:dio/dio.dart';

class GetNewsService {
 static  Future<dynamic> getNews() async {
    try {
      Response response = await Dio(BaseOptions(validateStatus: ((status) {
        if (status! >= 100 && status <= 599) {
          return true;
        } else {
          return false;
        }
      }))).get("http://192.168.42.35:3000/news");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
