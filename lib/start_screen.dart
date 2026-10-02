import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() startQuiz;
  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 300),
          SizedBox(height: 20),
          Text('Learn Flutter the fun way!', style: TextStyle(color: Colors.white, fontSize: 24)),
          SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              // backgroundColor: Color.fromARGB(255, 90, 20, 255),
              foregroundColor: Colors.white,
              textStyle: TextStyle(fontSize: 20),
            ),
            icon: Icon(Icons.arrow_forward),
            label: Text('Start Quiz', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
