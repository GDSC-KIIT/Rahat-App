import 'package:flutter/material.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:rahat/components/selectPersonCard.dart';
import 'package:rahat/models/Person.dart';
import 'package:rahat/models/User.dart';
import 'package:rahat/services/personService.dart';
import 'package:rahat/services/userService.dart';
import 'package:rahat/views/sos/checkListScreen.dart';

class SelectPersonScreen extends StatefulWidget {
  final String disaster;
  SelectPersonScreen({this.disaster});
  @override
  _SelectPersonScreenState createState() => _SelectPersonScreenState();
}

class _SelectPersonScreenState extends State<SelectPersonScreen> {
  List<Person> persons = [];
  List<Person> selectedPerson = [];
  String disaster;
  User user;
  bool isLoading = false;
  bool tapped = false;
  List selected = [];

  @override
  void initState() {
    super.initState();
    disaster = widget.disaster;
    loadDataForUser();
  }

  loadDataForUser() async {
    setState(() {
      isLoading = true;
    });
    user = await UserService.getUser();
    persons = await PersonService.getPersons();
    selected = List.filled(persons.length, false);
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListView.builder(
                        itemCount: persons.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () {
                                if (!selected[index]) {
                                  selectedPerson.add(persons[index]);
                                } else {
                                  selectedPerson.removeWhere((value) {
                                    if (value == persons[index])
                                      return true;
                                    else
                                      return false;
                                  });
                                }
                                setState(() {
                                  selected[index] = !selected[index];
                                });
                              },
                              child: SelectPersonCard(
                                person: persons[index],
                                selectedColor: Colors.orange,
                                tapped: selected[index],
                              ));
                        }),
                    SizedBox(height: UIConstants.fitToHeight(28, context)),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return CheckListScreen(
                            persons: selectedPerson,
                            disaster: disaster,
                          );
                        }));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        alignment: Alignment.center,
                        height: UIConstants.fitToHeight(43, context),
                        width: UIConstants.fitToWidth(142, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xffFDC830),
                              Color(0xffF37335)
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: const Text('NEXT',
                            style: TextStyle(fontSize: 15, letterSpacing: 0.5)),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
