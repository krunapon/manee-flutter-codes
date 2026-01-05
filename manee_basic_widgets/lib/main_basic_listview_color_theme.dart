import 'package:flutter/material.dart';

import '../models/faculty.dart';

void main() {
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
      home: const FacultyListExample(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class FacultyListExample extends StatelessWidget {
  const FacultyListExample({super.key});

  // Handle when a faculty is tapped
  void _handleFacultyTap(BuildContext context, Faculty faculty) {
    // Show a message using ScaffoldMessenger
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${faculty.name} (${faculty.code}) was selected'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Create our list of faculties
    final List<Faculty> faculties = [
      const Faculty(name: "Engineering", code: "EN", icon: Icons.engineering),
      const Faculty(name: "Agriculture", code: "AG", icon: Icons.agriculture),
      const Faculty(name: "Architecture", code: "AR", icon: Icons.architecture),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Faculty List')),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: faculties.map((faculty) {
          return ListTile(
            leading: Icon(
              faculty.icon,
              color: Theme.of(context).colorScheme.primary,
            ), // Systematic!),
            title: Text(
              faculty.name,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            subtitle: Text(
              'Code: ${faculty.code}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            onTap: () => _handleFacultyTap(context, faculty),
          );
        }).toList(),
      ),
    );
  }
}
