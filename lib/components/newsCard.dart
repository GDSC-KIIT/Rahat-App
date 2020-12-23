import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:rahat/models/News.dart';
import 'package:rahat/views/news/newsDetailsScreen.dart';

class NewsCard extends StatelessWidget {
  final News news;
  NewsCard({this.news});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 8, 12),
      child: Container(
        height: UIConstants.fitToHeight(180, context),
        width: UIConstants.fitToWidth(340, context),
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xff323232),
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, -2),
                  blurRadius: 4,
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                ),
                BoxShadow(
                  offset: Offset(-2, 2),
                  blurRadius: 2,
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                ),
              ]),
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return NewsDetailsScreen(news: news);
              }));
            },
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.0),
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
              topRight: Radius.circular(0.0),
            ),
            splashColor: Color(0xffC4C4C4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: UIConstants.fitToHeight(135, context),
                    width: UIConstants.fitToWidth(340, context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topRight: Radius.circular(12.0),
                      ),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/loader.gif',
                        image: '${news.urlToImage}',
                        fit: BoxFit.cover,
                        height: UIConstants.fitToHeight(135, context),
                        width: UIConstants.fitToWidth(340, context),
                      ),
                    )),
                Container(
                  height: UIConstants.fitToHeight(45, context),
                  width: UIConstants.fitToWidth(340, context),
                  decoration: BoxDecoration(
                    color: Color(0xff323232),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0.0),
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('${news.title}',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
