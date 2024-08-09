  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  import 'task_list_provider.dart';
  import 'add_task_list_screen.dart';

  class TaskListScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      final provider = Provider.of<TaskListProvider>(context);

      return Scaffold(
        appBar: AppBar(
          title: Text('To-Do List'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTaskScreen()),
                );
              },
            ),
          ],
        ),
        body: provider.isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: provider.tasks.length,
                itemBuilder: (context, index) {
                  final task = provider.tasks[index];
                  return ListTile(
                    title: Text(task.title),
                    subtitle: task.description != null ? Text(task.description!) : null,
                    trailing: Checkbox(
                      value: task.isCompleted,
                      onChanged: (value) {
                        provider.updateTask(task);
                      },
                    ),
                    onLongPress: () => provider.deleteTask(task.id),
                  );
                },
              ),
      );
    }
  }