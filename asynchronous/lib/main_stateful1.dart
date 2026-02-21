import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management by Stateful Widgets',
      home: Scaffold(body: Center(child: CounterWidget())),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  CounterWidgetState createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  void _resetCounter() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Count: $_count',
            style:
                const TextStyle(decoration: TextDecoration.none, fontSize: 40)),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: const Text('Increment',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  color: Colors.blueAccent)),
        ),
        ElevatedButton(
          onPressed: _resetCounter,
          child: const Text('Reset',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  color: Colors.orange)),
        ),
      ],
    );
  }
}
