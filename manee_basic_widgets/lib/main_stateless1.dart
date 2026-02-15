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
      debugShowCheckedModeBanner: false,
      title: 'StatelessWidget: Counter',
      home: Scaffold(
        appBar: AppBar(title: const Text("StatelessWidget: Counter")),
        body: ItemCount(count: 0),
      ),
    );
  }
}

class ItemCount extends StatelessWidget {
  int count;

  ItemCount({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Counter is $count",
            style: const TextStyle(fontSize: 30, color: Colors.red),
          ),
          ElevatedButton(
            onPressed: () {
              count++;
            },
            child: Text(
              "Increment counter",
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
