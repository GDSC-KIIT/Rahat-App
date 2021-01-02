import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:rahat/components/personCard.dart';
import 'package:rahat/models/Person.dart';
import 'package:rahat/models/User.dart';
import 'package:rahat/services/personService.dart';
import 'package:rahat/views/profile/addPersonScreen.dart';

class PersonScreen extends StatefulWidget {
  final User user;
  PersonScreen({this.user});
  @override
  _PersonScreenState createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  User user;
  List<Person> persons = [];
  bool isLoading = false;
  final scaffkey = new GlobalKey<ScaffoldState>();
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    user = widget.user;
    loadDataForScreen();
  }

  Future<Null> loadDataForScreen() async {
    setState(() {
      isLoading = true;
    });
    persons = await PersonService.getPersons();
    setState(() {
      isLoading = false;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffkey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Members'),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Color(0xffF37335))))
          : RefreshIndicator(
              key: refreshKey,
              onRefresh: loadDataForScreen,
              color: Color(0xffF37335),
              child: Container(
                height: UIConstants.fitToHeight(640, context),
                width: UIConstants.fitToWidth(360, context),
                child: persons.length == 0
                    ? Center(
                        child: Text(
                          'No Persons in the list.',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: persons.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onLongPress: () async {
                                await deletePerson(context, persons[index]);
                              },
                              child: PersonCard(person: persons[index]));
                        }),
              ),
            ),
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

  deletePerson(BuildContext context, Person person) async {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text('Delete!'),
            content: Text('Do you want to remove this person from the list?'),
            actions: [
              FlatButton(
                  onPressed: () async {
                    await removePerson(person.id);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(color: Colors.black),
                  )),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'No',
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          );
        });
  }

  removePerson(String personId) async {
    try {
      bool isDeleted = await PersonService.deletePerson(personId);
      if (isDeleted) {
        scaffkey.currentState.showSnackBar(new SnackBar(
          content: new Text("Pull to refresh!!!"),
          duration: Duration(milliseconds: 1500),
        ));
      } else {
        scaffkey.currentState.showSnackBar(new SnackBar(
          content: new Text("Failed to remove this person!!!"),
          duration: Duration(milliseconds: 1500),
        ));
      }
    } catch (e) {
      print(e);
      scaffkey.currentState.showSnackBar(new SnackBar(
        content: new Text("Please check your network. Please retry!!!"),
        duration: Duration(milliseconds: 1500),
      ));
    }
  }
}
