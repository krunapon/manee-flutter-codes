import 'dart:convert';
import 'package:flutter/material.dart';
import 'screens/news_item.dart';
import 'package:http/http.dart' as http;
import 'models/news.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Entry point of the application
/// Loads environment variables before running the app
void main() async {
  // Load environment variables from .env file
  // This keeps API keys secure and out of source code
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Page',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        brightness: Brightness.light, // Light theme
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark, // Dark theme
        ),
      ),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'News Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/// State class for MyHomePage
/// Manages the news fetching, loading states, and error handling
class _MyHomePageState extends State<MyHomePage> {
  // List to store fetched articles
  List<Article> _newsList = [];

  // Loading state indicator
  bool _isLoading = true;

  // Error message state
  String? _errorMessage;

  /// Fetches news from the API
  /// Returns Future<void> because it's an async operation
  Future<void> getData() async {
    try {
      // Build the API URL using environment variables
      var url = Uri.parse(
        '${dotenv.env['BASE_URL']}/everything?q=thai&apiKey=${dotenv.env['NEWS_API_KEY']}',
      );

      // Make HTTP GET request to fetch data
      http.Response response = await http.get(url);
      debugPrint("url is  $url");

      // CRITICAL: Check if widget is still mounted before setState
      // Prevents crash if user navigates away while data loads
      if (!mounted) return;
      setState(() {
        // Parse JSON response and filter by trusted publisher
        _newsList = News.fromJson(
          json.decode(response.body),
          trustedPublisher: "al-jazeera-english",
        ).articles;
        _isLoading = false;
      });
    } catch (e) {
      // Handle any errors during API call
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _errorMessage = "Failed to load news";
      });
    }
  }

  /// Called when widget is first inserted into the tree
  /// Good place to initialize data fetching
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // Show loading indicator while fetching data
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    // Show error message if API call failed
    if (_errorMessage != null) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(child: Text(_errorMessage!)),
      );
    }

    // Show message if no articles found
    if (_newsList.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(child: Text("No articles found")),
      );
    }

    debugPrint("Num news is ${_newsList.length}");

    // Show the list of news articles
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.builder(
        itemCount: _newsList.length,
        itemBuilder: (context, index) => ListItem(_newsList[index]),
      ),
    );
  }
}
