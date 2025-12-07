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
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
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
        child: Text(
          'This is a very long product description that needs to be truncated...',
          style: TextStyle(fontSize: 30),
          // Essential for Lists/Cards:
          maxLines: 2,
          overflow: TextOverflow.ellipsis, // Adds "..." at the end
          softWrap: true, // Default is true. Set false to force single line.
        ),
      ),
    );
  }
}
