import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rahat/models/User.dart';
import 'package:rahat/services/authService.dart';

class UserService extends AuthService {
  static Future<String> getUserId() async {
    Map<String, dynamic> credentials = await AuthService.getSavedAuth();
    return credentials['id'];
  }

  static Future<User> getUser() async {
    String id = await getUserId();
    http.Response response = await AuthService.makeAuthenticatedRequest(
        AuthService.BASE_URI + 'user/$id',
        method: 'GET');
    if (response.statusCode == 200) {
      var responseMap = json.decode(response.body);
      User user = User.fromJson(responseMap);
      return user;
    }
  }
}
