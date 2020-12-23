import 'package:http/http.dart' as http;

class BaseService {
  static const BASE_URI = "http://174.138.122.160/api/";
  static final Map<String, String> headers = {
    "Content-Type": "application/json"
  };

  static Future<http.Response> makeUnauthenticatedRequest(String url,
      {String method = 'POST',
      body,
      mergeDefaultHeader = true,
      Map<String, String> extraHeaders}) async {
    try {
      extraHeaders ??= {};
      var sentHeaders =
          mergeDefaultHeader ? {...headers, ...extraHeaders} : extraHeaders;

      switch (method) {
        case 'POST':
          body ??= {};
          return http.post(url, headers: sentHeaders, body: body);
          break;

        case 'GET':
          return http.get(url, headers: headers);
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
}
