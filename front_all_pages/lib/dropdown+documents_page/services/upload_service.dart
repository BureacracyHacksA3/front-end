import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> uploadFile(int id) async {
  final url = Uri.parse('http://localhost:6969/api/tasks/upload/byId/$id');

  final response = await http.post(url);

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final result = jsonResponse['result'] as String;
    return result;
  } else {
    throw Exception('Failed to upload file. Status code: ${response.statusCode}');
  }
}
