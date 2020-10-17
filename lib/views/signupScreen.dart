import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:rahat/services/authService.dart';
import 'package:rahat/views/homeScreen.dart';
import 'package:rahat/views/signinScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formkey = new GlobalKey<FormState>();
  final scaffkey = new GlobalKey<ScaffoldState>();

  String _name;
  String _lastName;
  String _email;
  String _password;
  String _phone;
  bool _loggingIn = false;

  checkFields() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    setState(() {
      _loggingIn = false;
    });
    return false;
  }

  signup() async {
    setState(() {
      _loggingIn = true;
    });
    if (checkFields()) {
      var payload = json.encode({
        'name': _name,
        'lastName': _lastName,
        'phone': _phone,
        'email': _email,
        'password': _password
      });
      bool authenticated = await AuthService.signUp(payload);
      if (authenticated) {
        var user = await AuthService.getSavedAuth();
        print(user['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) {
          return HomeScreen();
        }), (Route<dynamic> route) => false);
      } else {
        setState(() {
          _loggingIn = false;
        });
        scaffkey.currentState.showSnackBar(new SnackBar(
          content: new Text("Authentication failure !! Please retry."),
        ));
      }
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffkey,
      body: SingleChildScrollView(
        child: Container(
          height: UIConstants.fitToHeight(640, context),
          width: UIConstants.fitToHeight(360, context),
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
              SizedBox(height: UIConstants.fitToHeight(30, context)),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: UIConstants.fitToHeight(50, context),
                      left: UIConstants.fitToWidth(42.5, context),
                      right: UIConstants.fitToWidth(42.5, context)),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _input("Please Enter your First Name", false,
                            "First Name", 'First Name', (value) {
                          _name = value;
                        }),
                        SizedBox(height: UIConstants.fitToHeight(20, context)),
                        _input("Please Enter your Last Name", false,
                            "Last Name", 'Last Name', (value) {
                          _lastName = value;
                        }),
                        SizedBox(height: UIConstants.fitToHeight(20, context)),
                        _input("Please Enter your Phone Number", false,
                            "Phone Number", 'Phone Number', (value) {
                          _phone = value;
                        }),
                        SizedBox(height: UIConstants.fitToHeight(20, context)),
                        _input(
                            "Please Enter your Email", false, "Email", 'Email',
                            (value) {
                          _email = value;
                        }),
                        SizedBox(height: UIConstants.fitToHeight(20, context)),
                        _input("Please Enter your Password", true, "Password",
                            'Password', (value) {
                          _password = value;
                        }),
                        SizedBox(height: UIConstants.fitToHeight(30, context)),
                        (!_loggingIn)
                            ? RaisedButton(
                                onPressed: () {
                                  signup();
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                textColor: Colors.white,
                                padding: EdgeInsets.all(0),
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
                                  child: const Text('SignUp',
                                      style: TextStyle(
                                          fontSize: 15, letterSpacing: 0.5)),
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            Color(0xffF37335))),
                              ),
                        SizedBox(height: UIConstants.fitToHeight(10, context)),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                return SignInScreen();
                              }));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Existing User? ',
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xff707070)),
                                ),
                                Text(
                                  'Log In',
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xffF47A25)),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
