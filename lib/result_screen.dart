import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions.dart';

class ResultScreen extends StatelessWidget {
  final void Function() startQuiz;
  final List<String> chosenAnswers;
  const ResultScreen(this.startQuiz, this.chosenAnswers, {super.key});

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question_text": questions[i].question,
        "question_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i],
        "correct": questions[i].answers[0] == chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummary();
    int correct = summary.where(
      (element) {
        return element["correct"] as bool;
      },
    ).length;
    int total = chosenAnswers.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You answered $correct of $total questions correctly!",
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 197, 157, 250),
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 450,
              child: SingleChildScrollView(
                child: Column(children: [
                  ...summary.map((e) => Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(20),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: e["correct"] as bool
                                    ? const Color.fromARGB(255, 46, 214, 172)
                                    : const Color.fromARGB(255, 238, 80, 80),
                              ),
                              child: Text(
                                ((e["question_index"] as int) + 1).toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      e["question_text"] as String,
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    e["question_answer"] as String,
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 155, 120, 253)),
                                  ),
                                  Text(
                                    e["user_answer"] as String,
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 199, 181, 248)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ))
                ]),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.replay),
              label: const Text(
                "Restart Quiz",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
