import 'package:flutter/material.dart';
import 'package:rahat/models/User.dart';
import 'package:rahat/views/profile/addPersonScreen.dart';

class PersonScreen extends StatefulWidget {
  final User user;
  PersonScreen({this.user});
  @override
  _PersonScreenState createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  User user;

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Members'),
        centerTitle: true,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffF47216),
          child: Icon(Icons.person_add, color: Colors.white),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return AddPersonScreen();
            }));
          }),
    );
  }
}
