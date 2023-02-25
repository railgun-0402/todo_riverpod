import 'package:riverpod/riverpod.dart';
import 'package:todo/model/todo.dart';

class TodoNotifier extends StateNotifier<List<Todo>> {
  // リストを空のリストとして初期化
  TodoNotifier() : super([]);
}
