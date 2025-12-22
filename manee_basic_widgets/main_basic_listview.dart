import 'package:flutter/material.dart';
import 'models/faculty.dart';

void main() {
  runApp(const MaterialApp(
    home: FacultyListExample(),
    debugShowCheckedModeBanner: false,
  ));
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
      const Faculty(
        name: "Engineering",
        code: "EN",
        icon: Icons.engineering,
      ),
      const Faculty(
        name: "Agriculture",
        code: "AG",
        icon: Icons.agriculture,
      ),
      const Faculty(
        name: "Architecture",
        code: "AR",
        icon: Icons.architecture,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty List'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: faculties.map((faculty) {
          return ListTile(
            leading: Icon(faculty.icon),
            title: Text(faculty.name),
            subtitle: Text('Code: ${faculty.code}'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => _handleFacultyTap(context, faculty),
          );
        }).toList(),
      ),
    );
  }
}
