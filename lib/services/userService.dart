import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rahat/models/User.dart';
import 'package:rahat/services/authService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService extends AuthService {
  static Future<User> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('id');
    http.Response response = await AuthService.makeAuthenticatedRequest(
        AuthService.BASE_URI + 'user/$id',
        method: 'GET');
    if (response.statusCode == 200) {
      var responseMap = json.decode(response.body);
      User user = User.fromJson(responseMap);
      return user;
    } else {
      print("DEBUG");
    }
  }

  static Future<User> updateUser(var payload) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('id');
    http.Response response = await AuthService.makeAuthenticatedRequest(
      AuthService.BASE_URI + 'user/$id',
      method: 'PUT'
    );
    if(response.statusCode == 200) {
      var responseMap = json.decode(response.body);

    }
  }
}
