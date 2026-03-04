import 'package:flutter/material.dart';

// You can pass any object to the arguments parameter.
// In this example, create a class that contains both
// a customizable title and message
class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

// A Widget that accepts the necessary arguments via the constructor
class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';
  final String title;
  final String message;

  // This Widget accepts the arguments as constructor paramegers
  // It does not extract the arguments from the ModalRoute
  //
  // The arguments are extracted by the onGenerateRoute function
  // provided to the MaterialApp widget
  const PassArgumentsScreen({
      Key? key,
      required this.title,
      required this.message,
    }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}


// A widget that extracts the necessary arguments from the ModalRoute
class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({Key? key}) : super(key: key);

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      )
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passing arguments demo'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            ElevatedButton(
              child: const Text('Extract arguments'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ExtractArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Extract Arguments Screen',
                    'Extracted in the build method',
                  ),
                );
              },
            ),
            // A button that navigates to a named route.
            // For this route, extract the arguments in the
            // onGenerateRoute function and pass them to the screen
            ElevatedButton(
              child: const Text("Accept arguments"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                // on tab change route
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Accept Arguments Screen',
                    'Extracted in the onGenerateRoute function',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}