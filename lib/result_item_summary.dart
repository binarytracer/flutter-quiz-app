import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultItemSummary extends StatelessWidget {
  final Map<String, Object> data;

  const ResultItemSummary({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = data['correctAnswer'] == data['selectedAnswer'];
    TextStyle? answerStyle = TextStyle(color: const Color.fromARGB(255, 243, 9, 91), fontWeight: FontWeight.bold);

    if (isCorrectAnswer) {
      answerStyle = TextStyle(color: const Color.fromARGB(255, 98, 241, 9), fontWeight: FontWeight.bold);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(data['number'].toString(), style: TextStyle(color: Colors.white)),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['question'].toString(),
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                data['correctAnswer'].toString(),
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              Text(data['selectedAnswer'].toString(), style: answerStyle),
            ],
          ),
        ),
      ],
    );
  }
}
