import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:rahat/models/News.dart';
import 'package:share_extend/share_extend.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {
  final News news;
  NewsDetails({this.news});
  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  News news;
  @override
  void initState() {
    super.initState();
    news = widget.news;
  }

  launchNews(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  shareNews(String url) async {
    if (Platform.isAndroid) {
      await ShareExtend.share('Check out this amazing News $url', "text");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NEWS'), centerTitle: true, actions: [
        IconButton(
            icon: Icon(Icons.open_in_browser),
            onPressed: () {
              launchNews('${news.url}');
            }),
        IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              shareNews('${news.url}');
            })
      ]),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            news.urlToImage != null
                ? Image.network('${news.urlToImage}')
                : Center(child: Image.asset('assets/images/mascot.png')),
            news.title != null
                ? Text('${news.title}',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white))
                : Text(''),
            news.description != null
                ? Text('${news.description}',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white))
                : Text(''),
            news.content != null
                ? Text('${news.content}',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white))
                : Text(''),
          ]),
    );
  }
}
