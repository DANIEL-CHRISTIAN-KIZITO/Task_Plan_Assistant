import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/task_database.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {
    final data = await TaskDatabase.instance.getAllTasks();
    setState(() => tasks = data);
  }

  void toggleDone(Task task) async {
    task.isDone = !task.isDone;
    await TaskDatabase.instance.update(task);
    loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TaskPlanAssistant')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(
              task.title,
              style: TextStyle(
                decoration:
                    task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
            subtitle: Text(task.note ?? ''),
            trailing: Checkbox(
              value: task.isDone,
              onChanged: (value) => toggleDone(task),
            ),
            onLongPress: () async {
              await TaskDatabase.instance.delete(task.id!);
              loadTasks();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (_) => AddTaskScreen()));
          loadTasks();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
