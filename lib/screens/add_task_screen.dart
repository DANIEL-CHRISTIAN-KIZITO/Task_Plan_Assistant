import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/task_database.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _noteController = TextEditingController();

  void saveTask() async {
    if (_titleController.text.isEmpty) return;
    final task = Task(
      title: _titleController.text,
      note: _noteController.text,
    );
    await TaskDatabase.instance.insert(task);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Task Title'),
            ),
            TextField(
              controller: _noteController,
              decoration: InputDecoration(labelText: 'Note'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveTask,
              child: Text('Save Task'),
            ),
          ],
        ),
      ),
    );
  }
}
