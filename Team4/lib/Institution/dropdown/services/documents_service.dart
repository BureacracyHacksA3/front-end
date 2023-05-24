import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ipApp/Login/login.dart';
import '../models/document.dart';

class DocumentApi {
  final String baseUrl = 'http://localhost:6969/api';

  String token = myUser.getToken();

  Future<List<Document>> getDocuments(String? name) async {
    final response = await http.get(Uri.parse('$baseUrl/tasks/$name'),
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Document> documents =
          body.map((dynamic item) => Document.fromJson(item)).toList();
      return documents;
    } else {
      throw "Failed to load documents list";
    }
  }
}
