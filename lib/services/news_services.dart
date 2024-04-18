import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio = Dio();

  Future<List<ArticleModel>> GetTopHeadlines({required String category}) async {
    try {
      final response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=b3e45daebe1846f8b0e04bc366cec09d&category=$category');

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];

      List<ArticleModel> articleList = [];
      for (var element in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(element);
        articleList.add(articleModel);
      }
      return articleList;
    } catch (e) {
      return [];
    }
  }
}
