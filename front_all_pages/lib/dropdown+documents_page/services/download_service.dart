import 'dart:typed_data';
import 'package:http/http.dart' as http;

Future<Uint8List> getByteArrayResource(int id) async {
  final url = Uri.parse('http://localhost:6969/api/tasks/download/byId/$id');

  final response = await http.get(url);
  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    throw Exception('Failed to load byte array resource');
  }
}
