import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rahat/models/Medical.dart';
import 'package:rahat/services/authService.dart';

class MedicalService extends AuthService {
  // ignore: missing_return
  static Future<List<Medical>> getAllMedicalList() async {
    http.Response response = await AuthService.makeAuthenticatedRequest(AuthService.BASE_URI + 'get/medical', method: 'GET');
    if (response.statusCode == 200) {
      var responseMap = json.decode(response.body);
      List<Medical> medical = responseMap
          .map<Medical>((medicalMap) => Medical.fromJson(medicalMap))
          .toList();
      return medical;
    } else {
      print("DEBUG");
    }
  }
}