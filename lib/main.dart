import 'package:crud/tasks.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const TaskListScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key, required this.title});

  final String title;

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class Tasks {
  List<String> tasks = ['task 1', 'task 2', 'task 3', 'task 4', 'task 5', 'task 6', 'task 7', 'task 8'];
  void addTask(text) {
    tasks.add(text);
  }
}
class _TaskListScreenState extends State<TaskListScreen> {
  late TextEditingController controller;
  
  void _removeTask() {}
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 500, child: TextField(controller: controller)),
              ElevatedButton(onPressed: addTask, child: Text("Add Task")),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return MyTask(text: tasks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
