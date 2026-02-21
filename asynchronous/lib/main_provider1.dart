import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyMainApp());
}

class MyMainApp extends StatelessWidget {
  const MyMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management by Stateful Widgets',
      home: Scaffold(body: Center(child: MyApp())),
    );
  }
}

// ChangeNotifier class to manage state
class Counter with ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners(); // Notify listeners about the change
  }

  void reset() {
    count = 0;
    notifyListeners(); // Notify listeners about the change
  }
}

// Main widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: const MyHomePage(),
    );
  }
}

// Home page widget
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter =
        Provider.of<Counter>(context); // access the Counter instance

    return Scaffold(
        appBar: AppBar(
          title: const Text('Provider Demo'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text('Count: ${counter.count}',
                  style: const TextStyle(
                      decoration: TextDecoration.none, fontSize: 40)),
              ElevatedButton(
                onPressed: () => counter.increment(),
                child: const Text('Increment',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20,
                        color: Colors.blueAccent)),
              ),
              ElevatedButton(
                onPressed: () => counter.reset(),
                child: const Text('Reset',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20,
                        color: Colors.orange)),
              ),
            ])));
  }
}
