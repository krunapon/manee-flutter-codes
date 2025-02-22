import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

// TODO: Create Contact class model here

class ContactManager extends StatefulWidget {
  const ContactManager({super.key});

  @override
  State<ContactManager> createState() => _ContactManagerState();
}

class _ContactManagerState extends State<ContactManager> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  List<Contact> _contacts = [];

  @override
  void initState() {
    super.initState();
    // TODO: Load contacts when app starts
  }

  // TODO: Implement _loadContacts method

  // TODO: Implement _saveContacts method

  // TODO: Implement _addContact method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Manager'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // TODO: Add TextFormFields for name, phone, and email
                  // TODO: Add save button
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                // TODO: Build contact list item
                return const SizedBox(); // Placeholder
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: ContactManager(),
    ),
  );
}
