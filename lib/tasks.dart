import 'package:flutter/material.dart';

class MyTask extends StatelessWidget {
  const MyTask({super.key, required this.text});

  void _removeTask() {
    
  }
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(height: 100, color: Colors.pink, child: Row(children: [Text(text), ElevatedButton(onPressed: _removeTask, child: Text("Remove Task"))],)),
    );
  }
}
