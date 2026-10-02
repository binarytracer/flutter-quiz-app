import 'package:flutter/material.dart';
import 'answer_button.dart';
import 'data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.addSelectedAnswer, {super.key});
  final void Function(String answer) addSelectedAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.addSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final shuffledAnswers = List.of(currentQuestion.answers);
    shuffledAnswers.shuffle();
    final currentAnswers = shuffledAnswers;

    return Center(
      child: Container(
        margin: EdgeInsets.all(50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ...currentAnswers.map((answer) => AnswerButton(answer, () => answerQuestion(answer))),
          ],
        ),
      ),
    );
  }
}
