import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rahat/models/Person.dart';
import 'package:rahat/services/authService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonService extends AuthService {
  static Future<bool> createPerson(var payload) async {
    var auth = await AuthService.getSavedAuth();
    http.Response response = await AuthService.makeAuthenticatedRequest(
        AuthService.BASE_URI + 'create/person/${auth['id']}',
        method: 'POST',
        body: payload);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // ignore: missing_return
  static Future<List<Person>> getPersons() async {
    var auth = await AuthService.getSavedAuth();
    http.Response response = await AuthService.makeAuthenticatedRequest(
        AuthService.BASE_URI + 'get/persons/${auth['id']}',
        method: 'GET');
    print(response.statusCode);
    if (response.statusCode == 200) {
      var responseMap = json.decode(response.body);
      List<Person> persons = responseMap
          .map<Person>((personMap) => Person.fromJson(personMap))
          .toList();
      return persons;
    } else {
      print("DEBUG");
    }
  }

  static Future<bool> updatePerson(String personId, var payload) async {
    var auth = await AuthService.getSavedAuth();
    http.Response response = await AuthService.makeAuthenticatedRequest(
        AuthService.BASE_URI + 'update/person/$personId/${auth['id']}',
        method: 'PUT',
        body: payload);
    if (response.statusCode == 200) {
      var responseMap = json.decode(response.body);
      Person person = Person.fromJson(responseMap);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deletePerson(String personId) async {
    var auth = await AuthService.getSavedAuth();
    http.Response response = await AuthService.makeAuthenticatedRequest(
        AuthService.BASE_URI + 'delete/person/$personId/${auth['id']}',
        method: 'DELETE');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
