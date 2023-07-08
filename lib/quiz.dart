import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // String activeState = "start-screen";
  final List<String> selectedAnswers = [];
  String activeState = "question-screen";

  void switchStates() {
    selectedAnswers.clear();
    setState(() {
      activeState = "question-screen";
    });
  }

  void chooseAnswer(answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeState = "result-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchStates);

    if (activeState == "question-screen") {
      screenWidget = QuestionScreen(chooseAnswer);
    } else if (activeState == "result-screen") {
      screenWidget = ResultScreen(switchStates, selectedAnswers);
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 46, 0, 153),
              Color.fromARGB(255, 82, 16, 156),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: screenWidget,
      ),
    );
  }
}
