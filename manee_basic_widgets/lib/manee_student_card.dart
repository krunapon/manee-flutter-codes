import 'package:flutter/material.dart';

void main() {
  Student student1 = Student(
    name: 'Manee Jaidee',
    initials: 'MJ',
    id: '123456789',
    gpa: 3.8,
  );

  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        brightness: Brightness.light, // Light theme
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark, // Dark theme
        ),
      ),
      themeMode: ThemeMode.system,
      home: StudentCard(student: student1),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Student {
  final String name;
  final String initials;
  final String id;
  final double gpa;

  Student({
    required this.initials,
    required this.name,
    required this.id,
    required this.gpa,
  });
}

class StudentCard extends StatelessWidget {
  final Student student;
  const StudentCard({required this.student});

  @override
  Widget build(BuildContext context) {
    // Get theme components once
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Card(
        color: colorScheme.surfaceContainerHighest,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Avatar with primary color
              CircleAvatar(
                backgroundColor: colorScheme.primaryContainer,
                child: Text(
                  student.initials,
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              SizedBox(width: 16),
              // Student info
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(student.name, style: textTheme.titleLarge),
                    Text(
                      student.id,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      'GPA: ${student.gpa}',
                      style: textTheme.labelMedium?.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
