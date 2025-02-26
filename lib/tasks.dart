import 'package:crud/main.dart';
import 'package:flutter/material.dart';

class MyTask extends StatelessWidget {
  const MyTask({super.key, required this.text, required this.index});

  final String text;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        width: 400,
        height: 100,
        color: Colors.pink,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(child: Text(text)),
            Positioned(
              right: 0,
              height: 50,
              width: 50,
              child: IconButton(
                onPressed: _removeTask,
                icon: Icon(Icons.close),
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
