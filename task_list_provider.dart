import 'package:flutter/material.dart';
import 'api_service.dart';
import 'task.dart';

class TaskListProvider with ChangeNotifier {
  List<Task> _tasks = [];
  bool _isLoading = false;
  final ApiService _apiService = ApiService();

  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;

  Future<void> fetchTasks() async {
    _isLoading = true;
    notifyListeners();
    try {
      _tasks = await _apiService.fetchTasks();
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addTask(Task task) async {
    await _apiService.addTask(task);
    await fetchTasks();
  }

  Future<void> updateTask(Task task) async {
    task.isCompleted = !task.isCompleted;
    await _apiService.updateTask(task);
    await fetchTasks();
  }

  Future<void> deleteTask(String id) async {
    await _apiService.deleteTask(id);
    await fetchTasks();
  }
}