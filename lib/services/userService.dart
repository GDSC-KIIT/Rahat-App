import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rahat/models/User.dart';
import 'package:rahat/services/authService.dart';

class UserService extends AuthService {
  static Future<User> getUser() async {
    String id = await AuthService.getUserId();
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
