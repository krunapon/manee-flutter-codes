import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class ScoreRecord {
  final String score;
  final String timestamp;

  ScoreRecord(this.score, this.timestamp);

  @override
  String toString() => 'Score: $score, Timestamp: $timestamp';
}

int compareScores(ScoreRecord a, ScoreRecord b) {
  // Sort by score first
  int scoreComparison = a.score.compareTo(b.score);
  if (scoreComparison != 0) {
    return scoreComparison;
  }

  // If scores are equal, sort by timestamp
  // descending order for timestamp
  return b.timestamp.compareTo(a.timestamp);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final TextEditingController scoreController = TextEditingController();
  final String _baseUrl =
      'https://mobileappdev2024-default-rtdb.asia-southeast1.firebasedatabase.app/scores2.json';
  // Replace with your database URL
  List<ScoreRecord> _records = [];

  List<ScoreRecord> sortScores(List<ScoreRecord> records) {
    records.sort((a, b) => compareScores(a, b));
    return records;
  }

  Future<void> _fetchData() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      debugPrint('data is $data');
      _records = (data as Map<String, dynamic>)
          .entries
          .map((entry) =>
              ScoreRecord(entry.value['score'], entry.value['timestamp']))
          .toList(); // Map entries to ScoreRecords
      debugPrint("records are $_records");
      List<ScoreRecord> sortedRecords = sortScores(_records);
      /*List<ScoreRecord> sortedRecords = List.from(_records)
        ..sort((a, b) => int.parse(a.score).compareTo(int.parse(b.score))); */
      _records = sortedRecords;
      debugPrint("records are $_records");
      setState(() {});
    } else {
      // Handle error
      debugPrint('Error fetching data: ${response.statusCode}');
    }
  }

  Future<void> _addRecord(String score) async {
    String timestamp = DateTime.now().toString();
    final body = jsonEncode({'score': score, 'timestamp': timestamp});
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Handle successful storage
      _fetchData();
    } else {
      // Handle error
      debugPrint('Error storing data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Score Records'),
        ),
        body: Column(
          children: [
            TextField(
              controller: scoreController,
              decoration: const InputDecoration(labelText: 'Enter Score'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _records.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_records[index].score),
                    subtitle: Text(_records[index].timestamp),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _addRecord(scoreController.text.toString());
              },
              child: const Text('Add Record'),
            ),
          ],
        ),
      ),
    );
  }
}
