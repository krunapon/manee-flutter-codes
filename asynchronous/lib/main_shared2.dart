import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Required before using any plugins/services in Flutter
  // Ensures the Flutter framework is properly initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Create SharedPreferencesWithCache instance at the app startup
  // This loads all saved values and caches them in memory
  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      // allowList specifies which keys to cache in memory
      // Using {'favoriteColor'} means ONLY this key is cached
      // This saves memory - only cache what you actually use
      allowList: {'favoriteColor'},
    ),
  );
  // Pass prefs to MyApp so it can be passed down the widget tree
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  // Store the prefs instance as a class filed
  final SharedPreferencesWithCache prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shared Preferences Demo',
      home: MyHomePage(prefs: prefs),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final SharedPreferencesWithCache prefs;
  const MyHomePage({super.key, required this.prefs});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _savedColor = '';

  @override
  void initState() {
    super.initState();
    _savedColor = widget.prefs.getString('favoriteColor') ?? 'No Color Saved';
  }

  // Saves the enterd color to persistent storage
  _saveColor(String color) async {
    // Write the new value to stroage (still async, needs await)
    // The value is persisted to device storage AND updated in cache
    await widget.prefs.setString('favoriteColor', color);

    // update the UI to show the newly saved color
    setState(() => _savedColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shared Preferences Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter your favorite color',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _saveColor(_controller.text);
              },
              child: const Text('Save Color'),
            ),
            Text('Saved Color: $_savedColor'),
          ],
        ),
      ),
    );
  }
}
