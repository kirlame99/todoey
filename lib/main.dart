import 'package:flutter/material.dart';
import 'screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'objects/tasks_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksList>(
      create: (context) => TasksList(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
