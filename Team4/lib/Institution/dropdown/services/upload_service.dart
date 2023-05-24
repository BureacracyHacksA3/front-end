import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../Login/login.dart';

Future<String> uploadFile() async {
  final url = Uri.parse('http://localhost:6969/api/tasks/upload/names');

  String token = myUser.getToken();

  final response =
      await http.post(url, headers: {'Authorization': 'Bearer $token'});

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final result = jsonResponse['result'] as String;
    return result;
  } else {
    throw Exception(
        'Failed to upload file. Status code: ${response.statusCode}');
  }
}
