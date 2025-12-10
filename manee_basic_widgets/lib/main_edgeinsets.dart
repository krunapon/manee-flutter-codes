import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
      ),
      title: 'Edge Insets Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Edge Insets Demo')),
        body: const Padding(
          padding: EdgeInsets.only(left: 100, top: 20, right: 100, bottom: 20),
          child: Text("Hello Flutter", style: TextStyle(fontSize: 40.0)),
        ),
      ),
    );
  }
}
