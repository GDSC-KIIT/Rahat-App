import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:rahat/models/User.dart';
import 'package:rahat/services/authService.dart';
import 'package:rahat/services/userService.dart';
import 'package:rahat/views/nasa/nasaPage.dart';
import 'package:rahat/views/news/newsScreen.dart';
import 'package:rahat/views/profile/profileScreen.dart';
import 'package:rahat/views/signinScreen.dart';
import 'package:rahat/views/sos/sosPage.dart';
import 'package:rahat/weather/weather.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String condition;
  int humidity;
  var temperature;
  User user;
  //Weather Fetching
  WeatherModel weather = WeatherModel();

  var windSpeed;

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
    var weatherData = await weather.getLocationWeather();
    updateUI(weatherData);
    setState(() {
      _isLoading = false;
    });
  }

  void updateUI(dynamic weatherData) async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        condition = '';
        humidity = 0;
        windSpeed = 0;
      }
      temperature = weatherData['main']['temp'];
      condition = weatherData['weather'][0]['main'];
      humidity = weatherData['main']['humidity'];
      windSpeed = weatherData['wind']['speed'];
    });
    // prefs.setInt("temperature", temperature);
    // prefs.setString("condition", condition);
    // prefs.setInt("humidity", humidity);
    // prefs.setDouble("windSpeed", windSpeed);
    // print("SAVED");
  }

  signOut() async {
    await AuthService.clearAuth();

    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) {
      return SignInScreen();
    }), (Route<dynamic> route) => false);
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
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return NasaPage();
                }));
              },
            ),
            ListTile(
              title: Text(
                "News",
                style: TextStyle(color: Color(0xffF47216), fontSize: 15),
              ),
              trailing: Icon(Icons.assessment, color: Colors.white),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return NewsScreen();
                }));
              },
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(
                    colors: <Color>[Color(0xffFDC830), Color(0xffF37335)],
                  ),
                ),
                child: Stack(children: [
                  Positioned(
                      child: temperature != null
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  top: 31.0, left: 21, right: 1.0),
                              child: Text(
                                '${temperature.toInt()}°C',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                  top: 31.0, left: 21, right: 1.0),
                              child: Text(
                                '',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                  Positioned(
                      child: condition != null
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 95.0, left: 21),
                              child: Text(
                                '$condition',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          : Container()),
                  Positioned(
                    child: temperature != null
                        ? Padding(
                            padding: const EdgeInsets.only(left: 17, top: 125),
                            child: Container(
                              height: UIConstants.fitToHeight(1, context),
                              width: UIConstants.fitToWidth(100.82, context),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(1.0)),
                            ),
                          )
                        : Container(),
                  ),
                  Positioned(
                      child: humidity != null
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(left: 21, top: 135),
                              child: Text(
                                'Humidity $humidity%',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          : Container()),
                  Positioned(
                      child: windSpeed != null
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(left: 21.0, top: 155),
                              child: Text(
                                'Wind ${windSpeed}mph',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          : Container()),
                  Positioned(
                      top: UIConstants.fitToHeight(30, context),
                      left: UIConstants.fitToWidth(170, context),
                      child: SvgPicture.asset('assets/images/darkBG.svg')),
                  Positioned(
                      top: UIConstants.fitToHeight(43, context),
                      left: UIConstants.fitToWidth(155, context),
                      child: SvgPicture.asset('assets/images/cloud.svg')),
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: UIConstants.fitToHeight(73, context),
                left: UIConstants.fitToWidth(30, context),
                right: UIConstants.fitToWidth(30, context),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return NasaPage();
                  }));
                },
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
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return SosPage();
                  }));
                },
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
      drawer: !_isLoading ? Drawer(child: drawerItems(context)) : null,
    );
  }
}
