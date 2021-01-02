import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahat/common/ui_constants.dart';

class EarthquakeScreen extends StatefulWidget {
  @override
  _EarthquakeScreenState createState() => _EarthquakeScreenState();
}

class _EarthquakeScreenState extends State<EarthquakeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Earthquake',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                  child: Image.asset(
                'assets/images/nasa/1.png',
                height: UIConstants.fitToHeight(100, context),
                width: UIConstants.fitToWidth(100, context),
                fit: BoxFit.contain,
              )),
            ),
            SizedBox(height: UIConstants.fitToHeight(12, context)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: const Divider(
                color: Color(0xff494949),
                height: 20,
                thickness: 1.0,
                indent: 0,
                endIndent: 0,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "DO'S",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF47A25),
                    )),
                  ),
                  SizedBox(
                    height: UIConstants.fitToHeight(16, context),
                  ),
                  Text(
                    '1. Take cover by getting under a sturdy table or other piece of furnitures.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '2. Stay away from glass, windows, outside doors and walls.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '3. Hold on and protect your head with a pillow.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '4. Move away from tall building, trees and utility wires.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: UIConstants.fitToHeight(12, context)),
                  const Divider(
                    color: Color(0xff494949),
                    height: 20,
                    thickness: 1.0,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Text(
                    "DONT'S",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF47A25),
                    )),
                  ),
                  SizedBox(height: UIConstants.fitToHeight(16, context)),
                  Text(
                    '1. Don\'t run around here and there, coming out of your houses, building.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '2. Never near a tree, or a building or a structure that might collapse.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '3. If trapped under debris, do not light a match.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '4. Don\'t be on the stairs, or under them in a quake.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
