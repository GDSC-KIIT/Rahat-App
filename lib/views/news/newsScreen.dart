import 'package:flutter/material.dart';
import 'package:rahat/components/newsCard.dart';
import 'package:rahat/models/News.dart';
import 'package:rahat/services/newsService.dart';
import 'package:rahat/views/news/newsDetails.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool isLoading = false;
  List<News> news = [];

  @override
  void initState() {
    super.initState();
    getAllNews();
  }

  getAllNews() async {
    setState(() {
      isLoading = true;
    });
    news = await NewsService.getNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('NEWS'),
            centerTitle: true,
            backgroundColor: Colors.transparent),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                backgroundColor: Color(0xffF47216),
              ))
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                    itemCount: news.length,
                    itemBuilder: (BuildContext context, index) {
                      var newsItem = news[index];
                      return Ink(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: InkWell(
                            //splashColor: Color(0xffF47216),
                            splashColor: Colors.white,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return NewsDetails(news: newsItem);
                              }));
                            },
                            child: NewsCard(news: newsItem)),
                      );
                    }),
              ));
  }
}
