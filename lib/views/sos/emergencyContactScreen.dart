import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContactScreen extends StatefulWidget {
  @override
  _EmergencyContactScreenState createState() => _EmergencyContactScreenState();
}

class _EmergencyContactScreenState extends State<EmergencyContactScreen> {

  callAction(String number) async {
    String url = 'tel:$number';
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not call $number';
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Emergency Contact',
          style: TextStyle(
            color: Color(0xffF37335)
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: UIConstants.fitToHeight(640, context),
        width: UIConstants.fitToWidth(360, context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: UIConstants.fitToHeight(16, context),
            ),
            callCard(context, 'Disaster Management Service', '108'),
            callCard(context, 'Earthquake/Flood/Disaster', '011-24363260'),
            callCard(context, 'NDRF Helpline Number', '9711077372'),
            callCard(context, 'National Emergency Number', '112'),
            callCard(context, 'Fire Brigade Service', '101'),
          ],
        ),
      ),
    );
  }

  Widget callCard(BuildContext context, String title, String number) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      child: Container(
        height: UIConstants.fitToHeight(60, context),
        decoration: BoxDecoration(
            color: Color(0xff494949),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  offset: Offset(2, -2),
                  blurRadius: 2,
                  color: Colors.white.withOpacity(0.25)),
              BoxShadow(
                  offset: Offset(-2, 2),
                  blurRadius: 2,
                  color: Colors.white.withOpacity(0.25))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$title',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.46))),
                  Text(
                    '$number',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.46)),
                  ),
                ],
              ),
              IconButton(
                onPressed: () async {
                  await callAction(number);
                },
                icon: Icon(Icons.call, color: Color(0xffF37335)),
                iconSize: 36,
              )
            ],
          ),
        ),
      ),
    );
  }
}
