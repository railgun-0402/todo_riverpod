import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/view/add_task.dart';
import 'package:todo/viewModel/todo_view_model.dart';

class Task extends StatefulWidget {
  const Task({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: detailTask(),
    );
  }
}

class detailTask extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(ref.watch(taskTitleProvider)),
        ),
        body: ListView(
          children: const <Widget>[
            Card(
              child: ListTile(
                title: Text('作業1'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('作業2'),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // 押下時処理
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddTask()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
