import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rahat/models/Person.dart';
import 'package:rahat/services/authService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonService extends AuthService {
  static Future<Person> createPerson(var payload) async {
    http.Response response = await AuthService.makeAuthenticatedRequest(
        AuthService.BASE_URI + 'create/person',
        method: 'POST',
        body: payload);
    if (response.statusCode == 200) {
      var responseMap = json.decode(response.body);
      Person person = Person.fromJson(responseMap);
      print(person);
      return person;
    } else {
      print("DEBUG");
    }
  }

  static Future<List<Person>> getPerson() async {
    http.Response response = await AuthService.makeAuthenticatedRequest(
        AuthService.BASE_URI + 'get/persons',
        method: 'GET');
    if (response.statusCode == 200) {
      var responseMap = json.decode(response.body);
      List<Person> person =
          responseMap.Map<Person>((personMap) => Person.fromJson(personMap))
              .toList();
      print(person);
      return person;
    } else {
      print("DEBUG");
    }
  }

  static Future<Person> updatePerson(String personId, var payload) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('id');
    http.Response response = await AuthService.makeAuthenticatedRequest(
        AuthService.BASE_URI + 'update/person/$personId/$id',
        method: 'PUT',
        body: payload);
    if (response.statusCode == 200) {
      var responseMap = json.decode(response.body);
      Person person = Person.fromJson(responseMap);
      print(person);
      return person;
    } else {
      print("DEBUG");
    }
  }

  static deletePerson(String personId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('id');
    http.Response response = await AuthService.makeAuthenticatedRequest(
        AuthService.BASE_URI + 'delete/person/$personId/$id',
        method: 'DELETE');
    if (response.statusCode == 200) {
      print("Deleted");
    } else {
      print("DEBUG");
    }
  }
}
