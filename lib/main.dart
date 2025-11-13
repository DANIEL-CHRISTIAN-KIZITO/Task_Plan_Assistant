import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(TaskPlanAssistant());
}

class TaskPlanAssistant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskPlanAssistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
