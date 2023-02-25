import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String id,
    // @Default('') String id; デフォルト値を与える場合の書き方
    required String description,
  }) = _Todo;
}
