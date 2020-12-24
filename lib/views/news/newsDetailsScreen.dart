import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:rahat/models/News.dart';
import 'package:share_extend/share_extend.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatefulWidget {
  NewsDetailsScreen({this.news});

  final News news;

  @override
  _NewsDetailsScreenState createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
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
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('NEWS'), centerTitle: true, actions: [
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              news.urlToImage != null
                  ? Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                          child: Image.network('${news.urlToImage}')))
                  : Center(child: Image.asset('assets/images/mascot.png')),
              SizedBox(height: UIConstants.fitToHeight(12, context)),
              news.title != null
                  ? Text('${news.title}',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )))
                  : Text(''),
              SizedBox(height: UIConstants.fitToHeight(32, context)),
              news.description != null
                  ? Text('${news.description}',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)))
                  : Text(''),
              SizedBox(height: UIConstants.fitToHeight(4, context)),
              news.content != null
                  ? Text('${news.content}',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)))
                  : Text(''),
            ]),
      ),
    );
  }
}
