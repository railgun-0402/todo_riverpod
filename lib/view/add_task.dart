import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/view/task.dart';
import 'package:todo/viewModel/todo_view_model.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _AddTaskPage(),
    );
  }
}

class _AddTaskPage extends ConsumerWidget {
  // titleのcontrollerをStateProviderで定義する
  final titleControllerStateProvider = StateProvider.autoDispose((ref) {
    return TextEditingController(text: '');
  });

  // 内容のcontrollerをStateProviderで定義する
  final descriptionControllerStateProvider = StateProvider.autoDispose((ref) {
    return TextEditingController(text: '');
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // titleのテキストフィールド値を監視
    final titleControllerProvider = ref.watch(titleControllerStateProvider);

    // descriptionのテキストフィールド値を監視
    final descriptionControllerProvider =
        ref.watch(descriptionControllerStateProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(ref.watch(addTaskTitleProvider)),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            children: [
              // タイトルテキスト
              TextFormField(
                controller: titleControllerProvider,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'タイトル',
                ),
              ),
              const SizedBox(height: 10),
              // 内容テキスト
              TextFormField(
                controller: descriptionControllerProvider,
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
                    print('title：${titleControllerProvider.text}');
                    print('description：${descriptionControllerProvider.text}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Task(
                              title: titleControllerProvider.text,
                              description: descriptionControllerProvider.text)),
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
