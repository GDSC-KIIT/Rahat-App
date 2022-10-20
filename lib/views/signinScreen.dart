import 'package:flutter/material.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:rahat/components/wavePainter.dart';
import 'package:rahat/services/authService.dart';
import 'package:rahat/views/homeScreen.dart';
import 'package:rahat/views/signupScreen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formkey = new GlobalKey<FormState>();
  final scaffkey = new GlobalKey<ScaffoldState>();

  String _email;
  bool _loggingIn = false;
  String _password;

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

  login() async {
    setState(() {
      _loggingIn = true;
    });

    if (checkFields()) {
      try {
        bool authenticated = await AuthService.authenticate(_email, _password);
        try {
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
            ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
              content: new Text("Authentication failure !! Please retry."),
            ));
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
            content: new Text("Authentication failure !! Please retry."),
          ));
          print(e);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          content: new Text("Authentication failure !! Please retry."),
        ));
        print(e);
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
        child: CustomPaint(
          painter: CurvePainter(),
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
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: UIConstants.fitToHeight(130, context),
                        left: UIConstants.fitToWidth(42.5, context),
                        right: UIConstants.fitToWidth(42.5, context)),
                    child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            _input("Please Enter your Email", false, "Email",
                                'Email', (value) {
                              _email = value;
                            }),
                            SizedBox(
                              height: UIConstants.fitToHeight(20, context),
                            ),
                            _input("Please Enter your Password", true,
                                "Password", 'Password', (value) {
                              _password = value;
                            }),
                            SizedBox(
                                height: UIConstants.fitToHeight(78, context)),
                            (!_loggingIn)
                                ? ElevatedButton(
                                    onPressed: login,
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      padding: const EdgeInsets.all(0.0),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height:
                                          UIConstants.fitToHeight(43, context),
                                      width:
                                          UIConstants.fitToWidth(142, context),
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
                                      child: const Text('Login',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              letterSpacing: 0.5)),
                                    ),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(
                                        valueColor:
                                            new AlwaysStoppedAnimation<Color>(
                                                Color(0xffF37335))),
                                  ),
                            SizedBox(
                                height: UIConstants.fitToHeight(10, context)),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) {
                                    return SignUpScreen();
                                  }));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'New User? ',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff707070)),
                                    ),
                                    Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffF47A25)),
                                    ),
                                  ],
                                ))
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
