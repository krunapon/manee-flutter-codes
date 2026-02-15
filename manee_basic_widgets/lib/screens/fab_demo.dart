import 'package:flutter/material.dart';

class FABDemo extends StatefulWidget {
  const FABDemo({super.key});

  @override
  FABDemoState createState() => FABDemoState();
}

class FABDemoState extends State<FABDemo> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(title: const Text("Floating Action Button Demo")),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text("Floating action button pressed $i times",
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w700))
            ])),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              setState(() {
                i++;
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('$i')));
              });
            },
            child: const Icon(Icons.add)));
  }
}
