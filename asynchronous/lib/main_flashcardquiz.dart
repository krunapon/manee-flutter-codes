import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:manee_states_demos/states/quizmodel.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => QuizModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(title: const Text('Flashcard Quiz')),
            body: Center(
                child: Consumer<QuizModel>(builder: (context, model, child) {
              final currentTerm = model.terms[model.currentIndex];
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        model.isFlipped
                            ? currentTerm.definition
                            : currentTerm.term,
                        style: const TextStyle(fontSize: 24)),
                    const SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: () => model.flipCard(),
                        child: Text(
                            model.isFlipped ? 'Show Term' : 'Show Definition')),
                    ElevatedButton(
                        onPressed: () => model.nextTerm(),
                        child: const Text('Next Term'))
                  ]);
            }))));
  }
}
