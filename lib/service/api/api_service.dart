import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

enum HttpMethod {
  GET,
  POST,
}

class ApiService extends GetxService {
  final String baseUrl = "http://localhost:3000";
  Future<void> _saveCookie(String cookie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cookie', cookie);
  }

  Future<String?> _getCookie() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('cookie');
  }

  Future<http.Response> _request(HttpMethod method, String url,
      [Map<String, dynamic>? data]) async {
    try {
      Get.dialog(const Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      String? cookie = await _getCookie();
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      if (cookie != null) {
        headers['Cookie'] = cookie;
      }

      http.Response response;
      switch (method) {
        case HttpMethod.GET:
          response = await http.get(Uri.parse(baseUrl + url), headers: headers);
          break;
        case HttpMethod.POST:
          response = await http.post(
            Uri.parse(baseUrl + url),
            headers: headers,
            body: data != null ? json.encode(data) : null,
          );
          break;
        default:
          throw UnsupportedError("Unsupported HTTP method");
      }

      if (response.headers.containsKey('set-cookie')) {
        String? setCookie = response.headers['set-cookie'];
        if (setCookie != null) {
          await _saveCookie(setCookie);
        }
      }

      return response;
    } finally {
      Get.back();
    }
  }

  Future<http.Response> request(String url, HttpMethod method,
      [Map<String, dynamic>? data]) {
    return _request(method, url, data);
  }
}
