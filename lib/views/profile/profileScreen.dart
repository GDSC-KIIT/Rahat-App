import 'package:flutter/material.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:rahat/models/User.dart';
import 'package:rahat/views/profile/editPersonScreen.dart';
import 'package:rahat/views/profile/personScreen.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  ProfileScreen({this.user});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            height: UIConstants.fitToHeight(640, context),
            width: UIConstants.fitToWidth(360, context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: UIConstants.fitToHeight(30, context),
                      left: UIConstants.fitToWidth(150, context),
                      right: UIConstants.fitToWidth(150, context)),
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      height: UIConstants.fitToHeight(60, context),
                      width: UIConstants.fitToWidth(60, context),
                      child: Image.asset('assets/images/mascot.png')),
                ),
                Container(
                  height: UIConstants.fitToHeight(40, context),
                ),
                listWidget('Name', user.name + ' '+ user.lastName),
                listWidget('Phone Number', user.phone),
                listWidget('Email', user.email),
                editButton(context)
              ],
            )),
      ),
    );
  }

  Widget listWidget(String title, String subTitle) {
    return Padding(
      padding: EdgeInsets.only(
          left: UIConstants.fitToWidth(25, context),
          right: UIConstants.fitToWidth(25, context),
          bottom: UIConstants.fitToHeight(25, context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            style: TextStyle(
                color: Color(0xff494949),
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          Divider(thickness: 2, color: Color(0xff494949)),
          Text(
            '$subTitle',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget editButton(context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return EditProfileScreen();
          }));
        },
        padding: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffFDC830), Color(0xffF37335)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(5.0)),
          child: Container(
            constraints: BoxConstraints(
                maxWidth: UIConstants.fitToWidth(143, context),
                minHeight: UIConstants.fitToHeight(43, context)),
            alignment: Alignment.center,
            child: Text(
              "Edit Profile",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
