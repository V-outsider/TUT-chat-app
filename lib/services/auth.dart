import 'package:http/http.dart' as http;
import '../serializable/models.dart';
import 'dart:convert';

const endpoint = 'http://192.168.10.2:1337/';

Future<User?> signUp(String username, String password) async {
  const url = '${endpoint}sign_up';

  final response = await http.post(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(User(username: username, password: password).toJson()));

  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  }

  return null;
}

Future<User?> logIn(String username, String password) async {
  const url = '${endpoint}log_in';

  final response = await http.post(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(User(username: username, password: password).toJson()));

  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  }

  return null;
}
