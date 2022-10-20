import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:rahat/models/Medical.dart';
import 'package:rahat/services/authService.dart';
import 'package:rahat/services/medicalService.dart';
import 'package:rahat/services/personService.dart';

class AddPersonScreen extends StatefulWidget {
  @override
  _AddPersonScreenState createState() => _AddPersonScreenState();
}

class _AddPersonScreenState extends State<AddPersonScreen> {
  bool isLoading = false;
  List<Medical> medical = [];
  final formkey = new GlobalKey<FormState>();
  final scaffkey = new GlobalKey<ScaffoldState>();

  String name = '';
  String age = '';
  String medicalCondition = '';
  String dropdownValue = 'None';

  @override
  void initState() {
    super.initState();
    loadDataForUser();
  }

  loadDataForUser() async {
    setState(() {
      isLoading = true;
    });
    medical = await MedicalService.getAllMedicalList();
    setState(() {
      isLoading = false;
    });
  }

  checkFields() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    setState(() {
      isLoading = false;
    });
    return false;
  }

  createPerson() async {
    if (checkFields()) {
      var auth = await AuthService.getSavedAuth();
      var payload = json.encode({
        "name": name,
        "age": age,
        "medicalCondition": medicalCondition,
        "userBy": "${auth['id']}"
      });
      try {
        bool isCreated = await PersonService.createPerson(payload);
        if (isCreated) {
          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
            content: new Text("Person Added!!!"),
            duration: Duration(milliseconds: 1500),
          ));
          Timer(Duration(milliseconds: 1500), () {
            Navigator.of(context).pop();
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
            content: new Text("Adding Person failed. Please retry!!!"),
            duration: Duration(milliseconds: 1500),
          ));
        }
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          content: new Text("Please check your network. Please retry!!!"),
          duration: Duration(milliseconds: 1500),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        content: new Text("Fill all the fields!!!"),
        duration: Duration(milliseconds: 1500),
      ));
    }
  }

  selectDropDown(String choice) {
    switch (choice) {
      case 'Asthma':
        setState(() {
          medicalCondition = medical[0].id;
        });
        break;
      case 'Blood Pressure':
        setState(() {
          medicalCondition = medical[1].id;
        });
        break;
      case 'Diabetes':
        setState(() {
          medicalCondition = medical[2].id;
        });
        break;
      case 'None':
        setState(() {
          medicalCondition = medical[3].id;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffkey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Add Persons'),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Color(0xffF37335))))
          : Container(
              height: UIConstants.fitToHeight(640, context),
              width: UIConstants.fitToHeight(360, context),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: UIConstants.fitToHeight(60, context)),
                    Image.asset(
                      UIConstants.logo,
                      height: UIConstants.fitToHeight(65, context),
                      width: UIConstants.fitToWidth(130, context),
                      fit: BoxFit.cover,
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: UIConstants.fitToHeight(80, context),
                            left: UIConstants.fitToWidth(42.5, context),
                            right: UIConstants.fitToWidth(42.5, context)),
                        child: Form(
                            key: formkey,
                            child: Column(
                              children: [
                                _input(
                                    "Please enter Name",
                                    false,
                                    "Name of the Person",
                                    'Name of the Person', (value) {
                                  name = value;
                                }),
                                SizedBox(
                                  height: UIConstants.fitToHeight(20, context),
                                ),
                                _input(
                                    "Please enter Age",
                                    false,
                                    "Age of the Person",
                                    'Age of the Person', (value) {
                                  age = value;
                                }),
                                SizedBox(
                                  height: UIConstants.fitToHeight(20, context),
                                ),
                                Container(
                                  width: UIConstants.fitToWidth(275, context),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  padding:
                                      EdgeInsets.only(left: 16.0, right: 16.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: dropdownValue,
                                      style: TextStyle(color: Colors.white),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue = newValue;
                                          selectDropDown(dropdownValue);
                                        });
                                      },
                                      items: <String>[
                                        'None',
                                        'Asthma',
                                        'Blood Pressure',
                                        'Diabetes'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        UIConstants.fitToHeight(78, context)),
                                (!isLoading)
                                    ? ElevatedButton(
                                        onPressed: createPerson,
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          padding: const EdgeInsets.all(0.0),
                                          //textColor: Colors.white,
                                        ),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: UIConstants.fitToHeight(
                                              43, context),
                                          width: UIConstants.fitToWidth(
                                              142, context),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            gradient: LinearGradient(
                                              colors: <Color>[
                                                Color(0xffFDC830),
                                                Color(0xffF37335)
                                              ],
                                            ),
                                          ),
                                          padding: const EdgeInsets.all(10.0),
                                          child: const Text('Create',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  letterSpacing: 0.5)),
                                        ),
                                      )
                                    : Center(
                                        child: CircularProgressIndicator(
                                            valueColor:
                                                new AlwaysStoppedAnimation<
                                                    Color>(Color(0xffF37335))),
                                      ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _input(String validation, bool, String label, String hint, save) {
    return new TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: TextStyle(fontSize: 15.0, color: Colors.black),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0)),
      ),
      obscureText: bool,
      validator: (value) => value.isEmpty ? validation : null,
      onSaved: save,
    );
  }
}
