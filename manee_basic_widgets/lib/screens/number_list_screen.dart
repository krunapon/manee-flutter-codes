import 'package:flutter/material.dart';

class NumberListScreen extends StatelessWidget {
  const NumberListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate 100 to do items
    return Scaffold(
        appBar: AppBar(title: const Text('Todo List')),
        body: ListView.builder(
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: const Icon(Icons.numbers),
                  title: Text('Item ${index + 1}'),
                  subtitle: Text('This is item number ${index + 1}'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('${index + 1} is tapped'),
                        duration: const Duration(seconds: 5)));
                  });
            }));
  }
}
