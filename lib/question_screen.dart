import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/quiz_question.dart';

import 'questions.dart';

class QuestionScreen extends StatefulWidget {
  final void Function(String answer) chooseAnswer;
  const QuestionScreen(
    this.chooseAnswer, {
    Key? key,
  }) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionNumber = 0;

  void nextQuestion(answer) {
    widget.chooseAnswer(answer);
    setState(() {
      questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    QuizQuestion currentQuestion = questions[questionNumber];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                fontSize: 24,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledQuestion().map((answers) {
              return AnswerButton(
                onTap: () {
                  nextQuestion(answers);
                },
                text: answers,
              );
            }),
          ],
        ),
      ),
    );
  }
}
