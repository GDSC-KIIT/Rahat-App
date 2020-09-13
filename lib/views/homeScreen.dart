import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, iconTheme: new IconThemeData(color: Color(0xffF47216)),),
      body: Center(
        child: Text('Nice Work', style: TextStyle(color: Colors.white),),
      ),
      drawer: Drawer(),
    );
  }
}
