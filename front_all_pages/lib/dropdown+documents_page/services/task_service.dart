import 'dart:convert';
import 'package:http/http.dart' as http;

class TasksService {
  final String baseUrl = 'http://localhost:6969/api/tasks/names';

  Future<List<String>> getTasksNames() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return List<String>.from(json);
    } else {
      throw Exception('Failed to load institution');
    }
  }
}