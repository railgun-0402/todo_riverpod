import 'package:riverpod/riverpod.dart';
import 'package:todo/model/todo.dart';

// taskのタイトル
final taskTitleProvider = Provider<String>((ref) {
  return 'TaskApp';
});

// add_taskのタイトル
final addTaskTitleProvider = Provider<String>((ref) {
  return 'タスク';
});

class TodoNotifier extends StateNotifier<List<Todo>> {
  // リストを空のリストとして初期化
  TodoNotifier() : super([]);
}
