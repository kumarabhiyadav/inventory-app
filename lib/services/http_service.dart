import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  static Map<String, String> headers = {
    'content-type': 'application/json',
  };

  static postRequest(String url, String body) async {
    try {
      final http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);
          if(response.statusCode >= 200 || response.statusCode <= 204 ){
           return json.decode(response.body);
          }else {

            return null;

          }
    } catch (e) {
      rethrow;
    }
  }

  static getRequest(String url) async {
    try {
      final http.Response response =
          await http.get(Uri.parse(url), headers: headers);
          if(response.statusCode >= 200 || response.statusCode <= 204 ){
           return json.decode(response.body);
          }else {
            return null;
          }
    } catch (e) {
      rethrow;
    }
  }
}
