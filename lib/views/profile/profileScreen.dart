import 'package:flutter/material.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:rahat/models/User.dart';
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
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      height: UIConstants.fitToHeight(60, context),
                      width: UIConstants.fitToWidth(60, context),
                      child: Image.asset('assets/images/mascot.png')),
                ),
                Container(
                  height: UIConstants.fitToHeight(20, context),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xffF47216)),
                  height: UIConstants.fitToHeight(300, context),
                  width: UIConstants.fitToWidth(300, context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    ListTile(
                      leading: Icon(Icons.perm_identity, color: Colors.white),
                      title: Text('${user.name} ${user.lastName}'),
                    ),
                    ListTile(
                      leading: Icon(Icons.email, color: Colors.white),
                      title: Text('${user.email}'),
                    ),
                    ListTile(
                      leading: Icon(Icons.call, color: Colors.white),
                      title: Text('Phone Number'),
                    ),
                    ListTile(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                          return PersonScreen(user: user);
                        }));
                      },
                      leading: Icon(Icons.person_add, color: Colors.white),
                      title: Text('Persons Added'),
                    ),
                  ]),
                )
              ],
            )),
      ),
    );
  }
}
