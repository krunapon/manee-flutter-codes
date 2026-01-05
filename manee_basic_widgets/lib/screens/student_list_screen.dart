import 'package:flutter/material.dart';

class Student {
  final String name;
  final String id;
  final double gpa;

  Student(this.name, this.id, this.gpa);
}

// Inside a widget
final List<Student> students = [
  Student('John Doe', '001', 3.8),
  Student('Jane Smith', '002', 3.9),
  Student('Bob Wilson', '003', 3.7),
];

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Student List')),
        body: ListView.builder(
            itemCount: students.length,
            itemBuilder: (content, int index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        students[index].name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text('ID: ${students[index].id}'),
                      Text('GPA: ${students[index].gpa}'),
                    ],
                  ),
                ),
              );
            }));
  }
}
