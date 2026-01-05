import 'package:flutter/material.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate 10 todo items
    final todos = List.generate(
      10,
      (index) => ListTile(
        leading: const Icon(Icons.check_box_outline_blank),
        title: Text('Todo Item ${index + 1}'),
        subtitle: Text('Description for todo ${index + 1}'),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: ListView(children: todos),
    );
  }
}
