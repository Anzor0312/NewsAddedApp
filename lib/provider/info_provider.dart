import 'package:flutter/cupertino.dart';
import 'package:news/data/service/increment_view_news_service.dart';
import 'package:news/data/service/like_news_service.dart';

class InfoProvider extends ChangeNotifier {
  IncrementViewNewsService incrementViewNewsService =
      IncrementViewNewsService();

  LikeNewsServise likeNewsServise = LikeNewsServise();

  void incrementCount({required String id}) async {
    await incrementViewNewsService.incrementCount(newsId: id);
  }

  void likeCount({required String id}) async {
    await likeNewsServise.like(newsId: id);
  }

  bool isLike = true;
  void isLiked() {
    if (isLike) {
      notifyListeners();
      isLike = false;
    } else {
      isLike = true;
      notifyListeners();
    }
  }
}
