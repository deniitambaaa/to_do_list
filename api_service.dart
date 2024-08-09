import 'package:http/http.dart' as http;
import 'dart:convert';
import 'task.dart';

class ApiService {
  final String baseUrl = 'https://66b487a09f9169621ea35751.mockapi.io/:endpoint';

  Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Task.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  Future<void> addTask(Task task) async {
    await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );
  }

  Future<void> updateTask(Task task) async {
    await http.put(
      Uri.parse('$baseUrl/${task.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );
  }

  Future<void> deleteTask(String id) async {
    await http.delete(Uri.parse('$baseUrl/$id'));
  }
}