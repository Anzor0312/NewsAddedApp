import 'package:dio/dio.dart';

class LikeNewsServise {
   Future<dynamic> like({required String newsId}) async {
    try {
      Response response = await Dio(BaseOptions(validateStatus: ((status) {
        if (status! >= 100 && status <= 599) {
          return true;
        } else {
          return false;
        }
      }))).put("http://192.168.42.35:3000/news/favorite$newsId");
      if (response.statusCode == 200) {
        return true;
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
