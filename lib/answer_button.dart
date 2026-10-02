import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onPressed, {super.key});

  final String answerText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(35, 114, 41, 223),
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        ),
        child: Text(answerText, textAlign: TextAlign.center),
      ),
    );
  }
}
