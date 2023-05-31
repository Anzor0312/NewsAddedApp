import 'package:flutter/cupertino.dart';
import 'package:news/data/service/post_news_service.dart';

class AddNewsProvider extends ChangeNotifier {
 
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController imgController = TextEditingController();

  bool isLoading = false;
  String errorMessage = "";
  PostNewsService postNewsService = PostNewsService();

  void postNews() async {
    isLoading = true;
    notifyListeners();
    await postNewsService
        .postNews(
            title: titleController.text,
            subtitle: subtitleController.text,
            img: imgController.text)
        .then((dynamic response) {
      if (response is bool) {
        isLoading = false;
        notifyListeners();
      } else {
        errorMessage = response;
        isLoading = false;
        notifyListeners();
      }
    });
  }
}
