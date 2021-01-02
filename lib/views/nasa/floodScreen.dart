import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahat/common/ui_constants.dart';

class FloodScreen extends StatefulWidget {
  @override
  _FloodScreenState createState() => _FloodScreenState();
}

class _FloodScreenState extends State<FloodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Flood',
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
                'assets/images/nasa/4.png',
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
                  SizedBox(height: UIConstants.fitToHeight(16, context)),
                  Text(
                    '1.Turn off gas valves fed to appliances, water valves and the electricity on the main fuse box.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '2. To prevent sewage backups, put sandbags in the toilet and obstructions on drain holes.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '3. Sop up and extract intruding waters when possible.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '4. Strong ropes and a well equipped First Aid Kit can greatly enhance rescue efforts.',
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
                  SizedBox(height: UIConstants.fitToHeight(12, context)),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Text(
                      '1. Don’t use open flames in the presence of gas, propane or natural gas. Use flashlights.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14.1,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    '2. Watch out for and don’t approach downed power lines.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '3. Touching or approaching wet, plugged-in electronics can lead to electrocution.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '4. Don’t drive through floodwaters. If stuck, exit the car and move to higher ground.',
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
