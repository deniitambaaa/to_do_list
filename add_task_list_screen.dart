  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  import 'task_list_provider.dart';
  import 'task.dart';

  class AddTaskScreen extends StatelessWidget {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Tambah Tugas')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Judul Tugas'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Deskripsi (opsional)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final newTask = Task(
                    id: '',
                    title: titleController.text,
                    description: descriptionController.text,
                  );
                  Provider.of<TaskListProvider>(context, listen: false).addTask(newTask);
                  Navigator.pop(context);
                },
                child: Text('Tambah Tugas'),
              ),
            ],
          ),
        ),
      );
    }
  }