import 'package:flutter/material.dart';

class ContactListScreen extends StatelessWidget {
// Sample contact data
  final List<Map<String, String>> contacts = [
    {'name': 'Alice Johnson', 'phone': '555-0101'},
    {'name': 'Bob Smith', 'phone': '555-0102'},
    {'name': 'Carol White', 'phone': '555-0103'},
    {'name': 'David Brown', 'phone': '555-0104'},
  ];

  ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ListView.separated(
        // Create the main list items
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(contacts[index]['name']![0]), // First letter of name
            ),
            title: Text(contacts[index]['name']!),
            subtitle: Text(contacts[index]['phone']!),
            onTap: () {
              // Handle tap event
            },
          );
        },
        // Create the separators between items
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            color: Colors.grey,
          );
        },
        itemCount: contacts.length,
      ),
    );
  }
}
