import 'package:flutter/material.dart';

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
                  height: 190,
                  width: 190,
                  child: Image.asset('assets/images/flood.png')),
            ),
            const Divider(
              color: Colors.white,
              height: 20,
              thickness: 1.0,
              indent: 0,
              endIndent: 0,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 328.0),
                  child: Text(
                    'DO\'S -',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Text(
                    '1.Turn off gas valves fed to appliances, water valves and the electricity on the main fuse box.                              ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, right: 40.0, left: 3.0),
                  child: Text(
                    '2. To prevent sewage backups, put sandbags in the toilet and obstructions on drain holes.            ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 6.0, left: 3.0, right: 115.0),
                  child: Text(
                    '3. Sop up and extract intruding waters when possible. ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 3.0,
                    right: 110.0,
                  ),
                  child: Text(
                    '4. Strong ropes and a well equipped First Aid Kit can greatly enhance rescue efforts.        ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                const Divider(
                  color: Colors.white,
                  height: 20,
                  thickness: 1.0,
                  indent: 0,
                  endIndent: 0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 300.0),
                  child: Text(
                    'DONT\'S -',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Text(
                    '1. Don’t use open flames in the presence of gas, propane or natural gas. Use flashlights.                                     ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, right: 40.0, left: 3.0),
                  child: Text(
                    '2. Watch out for and don’t approach downed power lines.           ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 6.0, left: 3.0, right: 115.0),
                  child: Text(
                    '3. Touching or approaching wet, plugged-in electronics can lead to electrocution. ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 3.0,
                    right: 110.0,
                  ),
                  child: Text(
                    '4. Don’t drive through floodwaters. If stuck, exit the car and move to higher ground.  ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
