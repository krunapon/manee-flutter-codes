import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BasicWidgetDemo(),
    );
  }
}

class BasicWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // Space outside the border
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          // Space inside the border (between border and text)
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            // Add a border
            border: Border.all(color: Colors.deepPurple, width: 2.0),
            // Add rounded corners
            borderRadius: BorderRadius.circular(16),
            // Optional: Add a shadow for depth
            boxShadow: [BoxShadow(blurRadius: 7, offset: const Offset(0, 3))],
          ),
          child: const Text(
            "I am a styled container!",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
