import 'package:flutter/material.dart';
import './components/kku_presidents_info.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Interactivity Exercise',
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: KKUPresidentsInfo()),
    );
  }
}
