import 'package:crud/tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

class _TaskListScreenState extends State<TaskListScreen> {
  late TextEditingController controller;
  List<dynamic> tasks = [
    ['task 1', false],
    ['task 2', false],
    ['task 3', false],
    ['task 4', false],
    ['task 5', false],
  ];
  void addTask() {
    setState(() {
      tasks.add([controller.text, false]);
    });
  }

  void removeTask(index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

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
              SizedBox(
                width: 500,
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              ElevatedButton(onPressed: addTask, child: Text("Add Task")),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Container(
                    width: 400,
                    height: 100,
                    color: Colors.pink,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          child: Text(
                            tasks[index][0],
                            style: TextStyle(
                              decoration:
                                  tasks[index][1]
                                      ? TextDecoration.lineThrough
                                      : null,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          height: 50,
                          width: 75,
                          child: Row(
                            children: [
                              Checkbox(
                                value: tasks[index][1],
                                activeColor: Colors.orangeAccent,
                                onChanged: (newBool) {
                                  setState(() {
                                    tasks[index][1] = newBool;
                                  });
                                },
                              ),
                              IconButton(
                                onPressed: () => removeTask(index),
                                icon: Icon(Icons.close),
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
