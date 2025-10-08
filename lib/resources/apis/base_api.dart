import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BaseApi {
  @protected
  Map<String, dynamic> parameters = <String, dynamic>{};
  String _url = '';

  String get url => _url;

  @protected
  set url(String endpoint) {
    final baseUrl = "https://api.escuelajs.co/api/v1/";
    _url = baseUrl +  endpoint;
  }

  Future<Map<String, dynamic>?> post() async {
    try {
      final body = json.encode(parameters);
      debugPrint(url);
      debugPrint(body);
      final response =
      await http.post(Uri.parse(url), body: body,);
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      _url = '';
      parameters = <String, dynamic>{};
      if (response.statusCode == 200) {
        final decodedResponse =
        await json.decode(response.body) as Map<String, dynamic>;
        return decodedResponse;
      } else {
        return await json.decode(response.body) as Map<String, dynamic>;
      }
    } on Exception catch (e) {
      debugPrint('Exception: $e');
      return null;
    }
  }

  Future<List<dynamic>?> get() async {
    try {
      debugPrint(url);
      final response =
      await http.get(Uri.parse(url).replace(queryParameters: parameters));
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      _url = '';
      parameters = <String, dynamic>{};
      if (response.statusCode == 200) {
        final decodedResponse =
        await json.decode(response.body);
        return decodedResponse;
      } else {
        return null;
      }
    } on Exception catch (e) {
      debugPrint('Exception: $e');
      return null;
    }
  }
}