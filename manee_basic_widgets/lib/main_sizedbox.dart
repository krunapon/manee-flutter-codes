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
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Text("First Item", style: TextStyle(fontSize: 30)),

            // The "Gap" - Adds 20 pixels of empty vertical space
            const SizedBox(height: 20),

            const Text("Second Item", style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
