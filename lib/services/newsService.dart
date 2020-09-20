import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rahat/models/News.dart';
import 'package:rahat/services/authService.dart';

class NewsService extends AuthService {
  static Future<List<News>> getNews() async {
    http.Response response = await AuthService.makeAuthenticatedRequest(
        'http://newsapi.org/v2/top-headlines?country=in&apiKey=bbea7f35c6754e1cab16e66986908f53',
        method: 'GET');

    if (response.statusCode == 200) {
      var responseMap = json.decode(response.body);
      List<News> news = responseMap['articles']
          .map<News>((newsMap) => News.fromJson(newsMap))
          .toList();
      return news;
    } else {
      print(response.statusCode);
    }
  }
}
