import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rahat/services/baseService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends BaseService {
  static const BASE_URI = "http://174.138.122.160/api/";
  static Map<String, dynamic> _authDetails;
  static const String authNamespace = "auth";

  // ignore: missing_return
  static Future<http.Response> makeAuthenticatedRequest(String url,
      {String method = 'POST',
      body,
      mergeDefaultHeader = true,
      Map<String, String> extraHeaders}) async {
    try {
      Map<String, dynamic> auth = await getSavedAuth();

      extraHeaders ??= {};
      var sentHeaders = mergeDefaultHeader
          ? {
              ...BaseService.headers,
              ...extraHeaders,
              "Authorization": "Bearer ${auth['token']}"
            }
          : extraHeaders;

      switch (method) {
        case 'POST':
          body ??= {};
          return http.post(url, headers: sentHeaders, body: body);
          break;

        case 'GET':
          return http.get(url, headers: sentHeaders);
          break;

        case 'PUT':
          return http.put(url, headers: sentHeaders, body: body);
          break;

        case 'DELETE':
          return http.delete(url, headers: sentHeaders);
        default:
          return http.post(url, headers: sentHeaders, body: body);
      }
    } catch (err) {
      print(err);
    }
  }

  static Future<Map<String, dynamic>> getSavedAuth() async {
    if (AuthService._authDetails != null) {
      return _authDetails;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> auth = prefs.getString(authNamespace) != null
        ? json.decode(prefs.getString(authNamespace))
        : null;

    AuthService._authDetails = auth;
    return auth;
  }

  static Future<bool> authenticate(String email, String password) async {
    var payload = json.encode({'email': email, 'password': password});
    print(payload);

    http.Response response = await BaseService.makeUnauthenticatedRequest(
        BaseService.BASE_URI + 'signin',
        body: payload);

    Map<String, dynamic> responseMap = json.decode(response.body);
    print(responseMap);

    String token = responseMap['token'];
    String id = responseMap['user']['id'].toString();

    bool success = token != null;

    if (success) _saveToken(token, email, id);
    return success;
  }

  static Future<bool> signUp(var payload) async {
    http.Response response = await BaseService.makeUnauthenticatedRequest(
        BaseService.BASE_URI + 'signup',
        body: payload);

    Map<String, dynamic> responseMap = json.decode(response.body);

    String token = responseMap['token'];
    String id = responseMap['user']['id'].toString();
    String email = responseMap['user']['email'].toString();

    bool success = token != null;

    if (success) _saveToken(token, email, id);
    return success;
  }

  static _saveToken(String token, String email, String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        authNamespace, json.encode({"token": token, "email": email, "id": id}));
  }


  static clearAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    _authDetails = null;
  }
}
