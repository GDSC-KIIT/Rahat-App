import 'package:flutter/material.dart';
import 'package:rahat/components/newsCard.dart';
import 'package:rahat/models/News.dart';
import 'package:rahat/services/newsService.dart';
import 'package:rahat/views/news/newsDetailsScreen.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool isLoading = false;
  List<News> news = [];
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    getAllNews();
  }

  Future<Null> getAllNews() async {
    setState(() {
      isLoading = true;
    });
    try {
      news = await NewsService.getNews();
    } catch (e) {
      print(e);
    }
    setState(() {
      isLoading = false;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('NEWS'),
            centerTitle: true,
            backgroundColor: Colors.black),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Color(0xffF37335))))
            : RefreshIndicator(
                key: refreshKey,
                onRefresh: getAllNews,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                      itemCount: news.length,
                      itemBuilder: (BuildContext context, index) {
                        var newsItem = news[index];
                        return NewsCard(news: newsItem);
                      }),
                ),
              ));
  }
}
