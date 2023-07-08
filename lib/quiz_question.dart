class QuizQuestion {
  final String question;
  final List<String> answers;
  const QuizQuestion(this.question, this.answers);
  List<String> getShuffledQuestion() {
    List<String> shuffled = List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }
}
