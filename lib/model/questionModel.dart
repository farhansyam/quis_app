class Questionmodel {
  const Questionmodel(this.question, this.answer);

  final String question;
  final List<String> answer;

  List<String> getShuffeledList() {
    final shuffeledQuestion = List.of(answer);
    shuffeledQuestion.shuffle();
    return shuffeledQuestion;
  }
}
