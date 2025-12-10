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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Basic Widget Demo')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Children at the beginning of the main axis
          // Children at the end of the cross axis
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.star, color: Colors.amber),
              SizedBox(width: 8),
              Text('Center', style: TextStyle(fontSize: 30)),
            ],
          ),
          // Row with SpaceBetween
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Left', style: TextStyle(fontSize: 30)),
              Text('Center', style: TextStyle(fontSize: 30)),
              Text('Right', style: TextStyle(fontSize: 30)),
            ],
          ),
          // Centered Column
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 64),
              SizedBox(height: 16),
              Text('Manee Jaidee', style: TextStyle(fontSize: 30)),
              Text('Software Developer', style: TextStyle(fontSize: 30)),
            ],
          ),
        ],
      ),
    );
  }
}
