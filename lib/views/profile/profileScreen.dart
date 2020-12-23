import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:rahat/models/User.dart';
import 'package:rahat/views/profile/addPersonScreen.dart';
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
                SizedBox(height: UIConstants.fitToHeight(40, context)),
                listWidget('Name', user.name + ' ' + user.lastName),
                listWidget('Phone Number', user.phone),
                listWidget('Email', user.email),
                personCard(context, 'Persons Added', onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return PersonScreen(user: user);
                  }));
                }),
                SizedBox(height: UIConstants.fitToHeight(32, context)),
                editButton(context)
              ],
            )),
      ),
    );
  }

  Widget listWidget(String title, String subTitle) {
    return Padding(
      padding: EdgeInsets.only(
          left: UIConstants.fitToWidth(24, context),
          right: UIConstants.fitToWidth(24, context),
          bottom: UIConstants.fitToHeight(24, context)),
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

  Widget personCard(context, String title, {VoidCallback onTap}) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: UIConstants.fitToHeight(35, context),
        width: UIConstants.fitToWidth(312, context),
        child: Ink(
          decoration: BoxDecoration(
              color: Color(0xff323232),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, -2),
                  blurRadius: 2,
                  color: Colors.white.withOpacity(0.15),
                ),
                BoxShadow(
                  offset: Offset(-2, 2),
                  blurRadius: 1,
                  color: Colors.white.withOpacity(0.15),
                ),
              ]),
          child: InkWell(
            borderRadius: BorderRadius.circular(4),
            splashColor: Color(0xff323232),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('$title',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500))),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
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
