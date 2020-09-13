import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:rahat/models/User.dart';
import 'package:rahat/services/authService.dart';
import 'package:rahat/services/userService.dart';
import 'package:rahat/views/profile/profileScreen.dart';
import 'package:rahat/views/signinScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User user;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    loadDataForScreen();
  }

  loadDataForScreen() async {
    setState(() {
      _isLoading = true;
    });
    user = await UserService.getUser();
    setState(() {
      _isLoading = false;
    });
  }

  signOut() async {
    await AuthService.clearAuth();

    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) {
      return SignInScreen();
    }), (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: new IconThemeData(color: Color(0xffF47216)),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: UIConstants.fitToHeight(20, context),
                  left: UIConstants.fitToWidth(30, context),
                  right: UIConstants.fitToWidth(30, context)),
              child: Container(
                height: UIConstants.fitToHeight(150, context),
                width: UIConstants.fitToWidth(300, context),
                child: SvgPicture.asset('assets/images/weatherWidget.svg',
                    fit: BoxFit.contain),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: UIConstants.fitToHeight(73, context),
                left: UIConstants.fitToWidth(30, context),
                right: UIConstants.fitToWidth(30, context),
              ),
              child: InkWell(
                child: Container(
                  height: UIConstants.fitToHeight(100, context),
                  width: UIConstants.fitToWidth(300, context),
                  child: SvgPicture.asset('assets/images/nasaWidget.svg',
                      fit: BoxFit.contain),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: UIConstants.fitToHeight(72, context),
                  left: UIConstants.fitToWidth(137.5, context),
                  right: UIConstants.fitToWidth(137.5, context),
                  bottom: UIConstants.fitToHeight(50, context)),
              child: InkWell(
                child: Container(
                  height: UIConstants.fitToHeight(85, context),
                  width: UIConstants.fitToWidth(85, context),
                  child: SvgPicture.asset('assets/images/sos.svg',
                      fit: BoxFit.contain),
                ),
              ),
            ),
          ],
        )),
      ),
      drawer: !_isLoading ? Drawer(child: drawerItems(context)) : Drawer(),
    );
  }

  Widget drawerItems(context) {
    return Container(
        color: Colors.black,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffF47216),
              ),
              accountName: Text('${user.name} ${user.lastName}'),
              accountEmail: Text('${user.email}'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black,
                child: Text(
                  "${user.name}".substring(0, 1),
                  style: TextStyle(fontSize: 40.0, color: Colors.white),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Profile",
                style: TextStyle(color: Color(0xffF47216), fontSize: 15),
              ),
              trailing: Icon(Icons.person, color: Colors.white),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ProfileScreen(user: user);
                }));
              },
            ),
            ListTile(
              title: Text(
                "Nasa",
                style: TextStyle(color: Color(0xffF47216), fontSize: 15),
              ),
              trailing: Icon(Icons.explore, color: Colors.white),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "News",
                style: TextStyle(color: Color(0xffF47216), fontSize: 15),
              ),
              trailing: Icon(Icons.assessment, color: Colors.white),
              onTap: () {},
            ),
            Divider(
              color: Color(0xff707070),
              thickness: 1.0,
            ),
            ListTile(
              title: Text(
                "Sign Out",
                style: TextStyle(color: Color(0xffF47216), fontSize: 15),
              ),
              trailing: Icon(Icons.exit_to_app, color: Colors.white),
              onTap: () {
                signOut();
              },
            ),
          ],
        ));
  }
}
