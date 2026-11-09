import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:text_form_field/models/user_data_model.dart';

class UserInfo {
  static Future<List<UserModel>> getUserInfo() async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    dynamic response = await http.get(
      url,
      headers: {'User-Agent': 'Mozilla/5.0', 'Accept': 'application/json'},
    );
    return (jsonDecode(response.body) as List)
        .map((e) => UserModel.fromJson(e))
        .toList();
  }
}
