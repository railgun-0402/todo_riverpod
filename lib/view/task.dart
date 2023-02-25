import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TaskApp'),
      ),
      body: ListView(
        children: <Widget>[
          Text('作業1'),
          Text('作業2'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 押下時処理
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
