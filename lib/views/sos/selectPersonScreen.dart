import 'package:flutter/material.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:rahat/models/Person.dart';
import 'package:rahat/models/User.dart';
import 'package:rahat/services/personService.dart';
import 'package:rahat/services/userService.dart';

class SelectPersonScreen extends StatefulWidget {
  @override
  _SelectPersonScreenState createState() => _SelectPersonScreenState();
}

class _SelectPersonScreenState extends State<SelectPersonScreen> {
  List<Person> persons = [];
  User user;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    loadDataForUser();
  }

  loadDataForUser() async {
    setState(() {
      isLoading = true;
    });
    user = await UserService.getUser();
    persons = await PersonService.getPersons();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Select People',
          style: TextStyle(color: Color(0xffF37335)),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Color(0xffF37335))))
          : Container(
              height: UIConstants.fitToHeight(640, context),
              width: UIConstants.fitToWidth(360, context),

            ),
    );
  }
}
