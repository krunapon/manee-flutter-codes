import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learning',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}


class _MyHomePageState extends State<MyHomePage> {
  bool switchValue = true;
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter show or hide widgets"),
      ),
      body: Container(
        margin: const EdgeInsets.all(0),
        width: double.infinity,
        height: MediaQuery.of(context).size.height*0.50,
        child: Column(
          children: [
            Switch(
              value: switchValue,
              onChanged: (value) {
                switchValue = value;
                isVisible = !isVisible;
                setState(() {

                });
              },
            ),
            Visibility(
              child: Image.asset("images/kku.jpg"),
              visible:isVisible,
            )
          ]
        )
      )
    );
  }
}