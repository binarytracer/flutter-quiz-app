import 'package:flutter/material.dart';
import 'data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'result_item_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.restartQuiz, required this.selectedAnswers});
  final void Function() restartQuiz;
  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < questions.length; i++) {
      summary.add({
        'number': i + 1,
        'question': questions[i].text,
        'correctAnswer': questions[i].correctAnswer,
        'selectedAnswer': selectedAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final correctAnswers = questions.map((question) => question.correctAnswer);
    final correctAnswerCount = correctAnswers.where((answer) => selectedAnswers.contains(answer)).length;

    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Result',
              style: GoogleFonts.aBeeZee(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
              textAlign: TextAlign.center,
            ),
            Text(
              'You got $correctAnswerCount out of ${questions.length}',
              textAlign: TextAlign.center,
              style: GoogleFonts.aDLaMDisplay(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...getSummaryData().map((data) {
                      return Column(
                        children: [
                          SizedBox(height: 10),
                          ResultItemSummary(data: data),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 80),
              child: OutlinedButton(
                onPressed: restartQuiz,
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white, textStyle: TextStyle(fontSize: 20)),
                child: Text('Restart Quiz'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
