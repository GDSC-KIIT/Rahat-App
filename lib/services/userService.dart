import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rahat/models/User.dart';
import 'package:rahat/services/authService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService extends AuthService {
  static Future<User> getUser() async {
    var auth = await AuthService.getSavedAuth();
    http.Response response = await AuthService.makeAuthenticatedRequest(
        AuthService.BASE_URI + 'user/${auth['id']}',
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
    var auth = await AuthService.getSavedAuth();
    http.Response response = await AuthService.makeAuthenticatedRequest(
        AuthService.BASE_URI + 'user/${auth['id']}',
        method: 'PUT');
    if (response.statusCode == 200) {
      var responseMap = json.decode(response.body);
    }
  }
}
