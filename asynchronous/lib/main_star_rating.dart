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
      // Using {'starRating'} means ONLY this key is cached
      // This saves memory - only cache what you actually use
      allowList: {'starRating'},
    ),
  );
  // Pass prefs to MyApp so it can be passed down the widget tree
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferencesWithCache prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Star Rating App',
      home: RatingScreen(prefs: prefs),
    );
  }
}

class RatingScreen extends StatefulWidget {
  final SharedPreferencesWithCache prefs;
  const RatingScreen({super.key, required this.prefs});

  @override
  RatingScreenState createState() => RatingScreenState();
}

class RatingScreenState extends State<RatingScreen> {
  // Current rating value (0-5), 0 means no rating
  int _rating = 0;

  @override
  void initState() {
    super.initState();
    // Load the previously saved rating, default to 0 if none exists
    _rating = widget.prefs.getInt('starRating') ?? 0;
  }

  /// Builds a single star icon button
  /// starIndex: 0-based position of this star (0-4)
  Widget _buildStar(int starIndex) {
    return IconButton(
      icon: Icon(
        Icons.star,
        // Fill the star with amber if it's less than current rating
        // otherwise show it as grey (unfilled)
        color: starIndex < _rating ? Colors.amber : Colors.grey,
      ),
      onPressed: () {
        // Save rating as starIndex + 1 (converts 0-4 to 1-5)
        _saveRating(starIndex + 1);
      },
    );
  }

  /// Saves the rating to persistent storage and updates the UI
  /// rating: the new rating value to save (1-5)
  Future<void> _saveRating(int rating) async {
    // Persist the rating to local storage
    await widget.prefs.setInt('starRating', rating);
    // IMPORTANT: Check if widget is still in the tree before setState
    // Prevents errors if user navigates away while save is in progress
    if (!mounted) return;
    setState(() => _rating = rating);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Star Rating')),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) => _buildStar(index)),
        ),
      ),
    );
  }
}
