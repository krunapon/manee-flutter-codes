import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Required before using any plugins/services in Flutter
  // Ensures the Flutter framework is properly initialized
  WidgetsFlutterBinding.ensureInitialized();

  // final prefs = await SharedPreferences.getInstance();
  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      //allowList: null means cache ALL keys (default behavior)
      //For better memory management, specify only the keys you need
      //allowList: {'counter', 'username', 'settings'},
      allowList: null,
    ),
  );
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferencesWithCache prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(prefs: prefs),
    );
  }
}

// StatefulWidget because it maintains state (_counter) that changes over time
class MyHomePage extends StatefulWidget {
  // Receive SharedPreferencesWithCache from parent
  final SharedPreferencesWithCache prefs;

  const MyHomePage({super.key, required this.prefs});

  @override
  MyHomePageState createState() => MyHomePageState();
}

// The state class for MyHomePage
// Holds mutable state and business logic
class MyHomePageState extends State<MyHomePage> {
  // Mutable variable to store the counter value
  int _counter = 0;

  // Called once when the widget is first inserted into the tree
  @override
  void initState() {
    super.initState();

    // Retrieve the saved counter value from persistent storage
    // With SharedPreferencesWithCache, reads are SYNCHRONOUS (no await needed!)
    // The value is cached in memory after first read, making it super fast
    // ?? 0 is the null-coalescing operator: returns 0 if key doesn't exist
    _counter = widget.prefs.getInt('counter') ?? 0;
  }

  // Increments the counter and saves it to persistent storage
  void _incrementCounter() async {
    // setState tells Flutter to rebuild the UI with new values
    setState(() {
      _counter++;
    });

    // Save the new value to persistent storage
    // Writes are still asynchronous (needs await)
    // The value is persisted to device storage AND updated in cache
    await widget.prefs.setInt('counter', _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Persistent Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
