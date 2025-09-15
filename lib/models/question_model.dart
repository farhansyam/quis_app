class QuestionModel {
  const QuestionModel(this.question, this.answer);

  final String question;
  final List<String> answer;

  List<String> getShuffeledAnswer() {
    final shuffeledAnswer = List.of(answer);
    shuffeledAnswer.shuffle();
    return shuffeledAnswer;
  }
}
