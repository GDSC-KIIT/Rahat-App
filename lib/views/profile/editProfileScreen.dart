import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Hi',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
