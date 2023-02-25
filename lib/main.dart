import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/view/task.dart';

void main() {
  runApp(const ProviderScope(child: Task()));
}
