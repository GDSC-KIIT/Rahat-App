import 'package:flutter/material.dart';

class EmergencyContact extends StatefulWidget {
  @override
  _EmergencyContactState createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Emergency Contact',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Container(
                child: Center(
                  child: Text(
                    'EMERGENCY NUMBERS-',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Text(
              'DISASTER MANAGEMENT SERVICES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.body1,
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Icon(
                          Icons.phone,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: '108',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'EARTHQUAKE / FLOOD / DISASTER',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.body1,
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Icon(
                          Icons.phone,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: '011-24363260',
                      style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Text(
                'NDRF HELPLINE NUMBER',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.body1,
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Icon(
                          Icons.phone,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: '9711077372',
                      style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Text(
                'NATIONAL EMERGENCY NUMBER',
                style: TextStyle(
                  fontSize: 20.0,color: Colors.white
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.body1,
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Icon(
                          Icons.phone,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: '112',
                      style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Divider(
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}
