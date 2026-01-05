import 'package:flutter/material.dart';

class TaskListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> tasks = [
    {'title': 'Complete project', 'priority': 'high'},
    {'title': 'Review code', 'priority': 'medium'},
    {'title': 'Update documentation', 'priority': 'low'},
    {'title': 'Team meeting', 'priority': 'high'},
  ];

  TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]['title'],
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            trailing: _getPriorityIcon(tasks[index]['priority']),
          );
        },
        // Separator changes color based on next task's priority
        separatorBuilder: (context, index) {
          // Get the priority color for the divider
          Color dividerColor = _getPriorityColor(tasks[index]['priority']);
          return Divider(
            height: 5,
            thickness: 5,
            color: dividerColor.withOpacity(0.9),
          );
        },
        itemCount: tasks.length,
      ),
    );
  }

  Icon _getPriorityIcon(String priority) {
    switch (priority) {
      case 'high':
        return const Icon(Icons.priority_high, color: Colors.red);
      case 'medium':
        return const Icon(Icons.remove_circle_outline, color: Colors.orange);
      default:
        return const Icon(Icons.arrow_downward, color: Colors.green);
    }
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      default:
        return Colors.green;
    }
  }
}
