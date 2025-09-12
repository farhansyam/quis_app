class Questionmodel {
  const Questionmodel(this.question, this.answer);

  final String question;
  final List<String> answer;

  List<String> getShuffeledAnswer() {
    final shuffeledanswer = List.of(answer);
    shuffeledanswer.shuffle();
    return shuffeledanswer;
  }
}
