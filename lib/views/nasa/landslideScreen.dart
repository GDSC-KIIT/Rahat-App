import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahat/common/ui_constants.dart';

class LandslideScreen extends StatefulWidget {
  @override
  _LandslideScreenState createState() => _LandslideScreenState();
}

class _LandslideScreenState extends State<LandslideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Landslide',
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
                'assets/images/landslide.png',
                height: UIConstants.fitToHeight(100, context),
                width: UIConstants.fitToWidth(100, context),
                fit: BoxFit.contain,
              )),
            ),
            const Divider(
              color: Color(0xff494949),
              height: 20,
              thickness: 1.0,
              indent: 0,
              endIndent: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                    '1. Move away from landslide path or downstream valleys quickly without wasting time.      ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '2. Stay alert, awake and active (3A\'s) during the impact or probability of impact.  ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '3. Keep drains clean and keep water holes open .    ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '4. Locate and go to shelters and Check for injured and trapped persons .     ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: UIConstants.fitToHeight(12, context)),
                  const Divider(
                    color: Colors.white,
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
                    '1. Do not panic and loose energy by crying and go near drainage path.                         ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '2. Watch out for and don’t approach downed power lines.          ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '3. Do not touch or walk over loose material and electrical wiring or pole. ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '4. Do not move an injured person without rendering first aid unless important. ',
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
