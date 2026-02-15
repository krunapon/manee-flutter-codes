import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ItemCounter extends StatefulWidget {
  const ItemCounter({Key? key}) : super(key: key);
  @override
  ItemCounterState createState() => ItemCounterState();
}

class ItemCounterState extends State<ItemCounter> {
  int count = 0;

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StatefulWidget: Counter',
      home: Scaffold(
        appBar: AppBar(title: const Text("StatefulWidget")),
        body: const ItemCounter(),
      ),
    );
  }
}
