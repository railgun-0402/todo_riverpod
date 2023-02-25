import 'package:flutter/material.dart';
import 'package:todo/view/task.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  // タイトル
  late String title = "";
  // 内容
  late String description = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('タスク'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            children: [
              // タイトルテキスト
              TextFormField(
                // 入力されたテキストの値を受け取る（valueが入力されたテキスト）
                onChanged: (String value) {
                  // データが変更したことを知らせる（画面を更新する）
                  setState(() {
                    // データを変更
                    title = value;
                  });
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'タイトル',
                ),
              ),
              const SizedBox(height: 10),
              // 内容テキスト
              TextFormField(
                // 入力されたテキストの値を受け取る（valueが入力されたテキスト）
                onChanged: (String value) {
                  // データが変更したことを知らせる（画面を更新する）
                  setState(() {
                    // データを変更
                    description = value;
                  });
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: '内容',
                ),
              ),
              const SizedBox(height: 12),
              // 決定ボタン
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    // "pop"で前の画面に戻る
                    // "pop"の引数から前の画面にデータを渡す
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Task(title: title, description: description)),
                    );
                  },
                  child: const Text('決定'),
                ),
              ),
              const SizedBox(height: 10),
              // 戻るボタン
              SizedBox(
                width: 120,
                child: OutlinedButton(
                  onPressed: () {
                    // 戻るだけ
                    Navigator.pop(context);
                  },
                  child: const Text('戻る'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
