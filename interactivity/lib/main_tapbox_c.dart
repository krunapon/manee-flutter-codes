import 'package:flutter/material.dart';
import './screens/tapbox_c.dart';

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
        appBar: AppBar(title: const Text('TapBoxC')),
        body: const Center(child: ParentWidget()),
      ),
    );
  }
}
