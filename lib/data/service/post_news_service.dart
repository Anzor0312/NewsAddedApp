import 'package:dio/dio.dart';

class PostNewsService {
   Future<dynamic> postNews({required String title,required String subtitle,required String img}) async {
    try {
      Response response = await Dio(BaseOptions(validateStatus: ((status) {
        if (status! >= 100 && status <= 599) {
          return true;
        } else {
          return false;
        }
      }))).post("http://192.168.42.35:3000/news",data: {
        "title": title,
        "subtitle":subtitle,
        "img":img
      });
      if (response.statusCode == 201) {
        return true;
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
