import 'package:flutter/material.dart';
import './screens/tapbox_b.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter interactive tutorial',
      home: Scaffold(
        appBar: AppBar(title: const Text('TapBoxB')),
        body: const Center(child: ParentWidget()),
      ),
    );
  }
}
