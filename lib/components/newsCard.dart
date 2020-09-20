import 'package:flutter/material.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:rahat/models/News.dart';

class NewsCard extends StatelessWidget {
  final News news;
  NewsCard({this.news});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 20.0),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffF47216),
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Image.network(
              "${news.urlToImage}",
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: Image.asset('assets/images/mascot.png'),
                );
              },
            ),
            subtitle: Text(
              '${news.title}',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}
