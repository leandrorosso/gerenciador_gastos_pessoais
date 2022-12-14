import 'dart:convert';
import 'package:http/http.dart' as http;

class RestUtil {
  static String urlBase = '192.168.2.215:3000';
  static String versaoUrl = 'api/v1/';

  static Future<http.Response> addData(
      String uri, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.http(urlBase, (versaoUrl + uri)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // 'x-api-key': 'sua_app_key'
      },
      body: jsonEncode(data),
    );
    return response;
  }

  static Future<http.Response> getData(String uri) async {
    final response = await http.get(
      Uri.http(urlBase, (versaoUrl + uri)),
      // headers: <String, String>{'x-api-key': 'sua_app_key'},
    );
    return response;
  }

  static Future<http.Response> getDataId(String uri, String id) async {
    final response = await http.get(
      Uri.http(urlBase, (versaoUrl + uri) + '/' + id),
      //headers: <String, String>{'x-api-key': 'sua_app_key'},
    );
    return response;
  }

  static Future<http.Response> removeDataId(String uri, String id) async {
    final response = await http.delete(
      Uri.http(urlBase, (versaoUrl + uri) + '/' + id),
      //headers: <String, String>{'x-api-key': 'sua_app_key'},
    );
    return response;
  }

  static Future<http.Response> editData(
      String uri, Map<String, dynamic> data, String id) async {
    final response = await http.put(
      Uri.http(urlBase, (versaoUrl + uri) + '/' + id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        //'x-api-key': 'sua_app_key'
      },
      body: jsonEncode(data),
    );
    return response;
  }
}
