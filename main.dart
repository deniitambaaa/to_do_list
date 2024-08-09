  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  import 'task_list_provider.dart';
  import 'task_list_screen.dart';

  void main() {
    runApp(MyApp());
  }

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return ChangeNotifierProvider(
        create: (context) => TaskListProvider(),
        child: MaterialApp(
          title: 'To-Do List',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: TaskListScreen(),
        ),
      );
    }
  }