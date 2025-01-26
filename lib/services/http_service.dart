import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:inventory_app/commonWidgets/toastmessage.dart';

class HttpService {
  static Map<String, String> headers = {
    'content-type': 'application/json',
  };

  static postRequest(String url, String body) async {
    try {
      print(url);
      print(json);
      final http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode >= 200 || response.statusCode <= 204) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  static getRequest(String url) async {
    try {
      print(url);
      final http.Response response =
          await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode >= 200 || response.statusCode <= 204) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  static postWithFiles(
      String url, String body, Map<String, String> files) async {
    try {
      print(url);
      print(body);
      print(files);
      final request = http.MultipartRequest('POST', Uri.parse(url));
      List<http.MultipartFile> multipartFiles = [];
      for (var entry in files.entries) {
        var key = entry.key;
        var imagePath = entry.value;
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath(key, imagePath);

        multipartFiles.add(multipartFile);
      }

      request.fields['data'] = body;
      request.files.addAll(multipartFiles);
      var response = await request.send();

      if (response.statusCode == 200) {
        print('File uploaded successfully');

        return response;
      } else {
        // Handle errors
        showToast(message: "Failed to create purchase ");
        return null;
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  static delete(String url) async {
    try {
      final http.Response response = await http.delete(Uri.parse(url));
      if (response.statusCode >= 200 || response.statusCode <= 204) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
