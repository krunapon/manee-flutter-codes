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
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
      ),
      home: BasicWidgetDemo(),
    );
  }
}

class BasicWidgetDemo extends StatelessWidget {
  const BasicWidgetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Basic Widget Demo')),
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
