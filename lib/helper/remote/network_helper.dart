import 'dart:convert';
import 'dart:io';

import 'package:electronicsstrore/utilities/constants.dart';
import 'package:http/http.dart' as http;

class NetworkProvider {
  final Uri uri = Uri(
      scheme: 'https',
      host: host,
      path: '/api',
    );

 Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

  Future<Map<String, dynamic>> post({required String url, dynamic body}) async {
   

    try {
      http.Response response =
          await http.post(Uri.parse(url), body: body, headers: headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception(
            'this is the problem is statusCode ${response.statusCode} with body ${jsonDecode(response.body)}');
      }
    } on SocketException {
      throw Exception('Check your Internet Connection');
    } on FormatException {
      throw Exception('there is problem in Data ');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> get({required String url}) async {
  
    try {
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'this is the problem statusCode ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
