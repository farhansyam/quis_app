import 'package:flutter/material.dart';
import 'package:quis_app/data/qustions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
    this.restartQuestion, {
    super.key,
    required this.selectedAnswer,
  });

  final Function() restartQuestion;
  final List<String> selectedAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answer[0],
        'user_answer': selectedAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData(); // panggil fungsi summary
    final correctCount = selectedAnswer.asMap().entries.where((entry) {
      final index = entry.key;
      final answer = entry.value;
      return answer == questions[index].answer[0];
    }).length;

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Ringkasan skor
            Card(
              color: Colors.blue.shade50,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'You answered $correctCount out of ${questions.length} questions correctly',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Judul List
            Text(
              'List of Answers and Questions:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 12),

            // List soal & jawaban
            ...summaryData.map((data) {
              final questionIndex = data['question_index'] as int? ?? 0;
              final questionText = data['question'] ?? 'No question';
              final correctAnswer = data['correct_answer'] ?? '';
              final userAnswer = data['user_answer'] ?? '';

              return Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Q${questionIndex + 1}: $questionText',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Correct Answer: $correctAnswer',
                        style: TextStyle(
                          color: Colors.green.shade700,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Your Answer: $userAnswer',
                        style: TextStyle(
                          color: userAnswer == correctAnswer
                              ? Colors.green
                              : Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),

            SizedBox(height: 20),

            // Tombol Restart
            Center(
              child: ElevatedButton(
                onPressed: restartQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 14.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Restart Quiz',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
