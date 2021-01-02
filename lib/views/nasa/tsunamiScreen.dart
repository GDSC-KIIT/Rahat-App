import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahat/common/ui_constants.dart';

class TsunamiScreen extends StatefulWidget {
  @override
  _TsunamiScreenState createState() => _TsunamiScreenState();
}

class _TsunamiScreenState extends State<TsunamiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Tsunami',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: UIConstants.fitToHeight(640, context),
        width: UIConstants.fitToWidth(360, context),
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                  child: Image.asset(
                'assets/images/tsunami.png',
                height: UIConstants.fitToHeight(100, context),
                width: UIConstants.fitToWidth(100, context),
                fit: BoxFit.contain,
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                  SizedBox(height: UIConstants.fitToHeight(16, context)),
                  Text(
                    '1. Know where the nearest tsunami escape route is.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '2. Move in an orderly, calm and safe manner to the evacuation site.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '3. Listen to radio or Television to get latest emergency information.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '4. If you hear a tsunami warning, move at once to higher ground.',
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
                    '1.Do not Rush to the beach to see the big wave.                                      ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '2. Stop to pack your most cherished possessions to take with you.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '3. Do not Hop in your car to get to higher ground.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '4. Do not eat food that has come in contact with flood water, it may be contaminated.',
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
