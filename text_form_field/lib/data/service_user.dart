import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServiceUser {
  static Future getUserData() async {
  Uri url = Uri.parse("https://jsonplaceholder.typicode.com/users");
  final resp = await http.get(
    url, 
    headers: {
    'User-Agent': 'Mozilla/5.0',
    'Accept': 'application/json',
  },
    );
    debugPrint(resp.statusCode.toString());
    return jsonDecode(resp.body);
  }
}