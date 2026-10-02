import 'package:flutter/material.dart';
import 'question_screen.dart';
import 'start_screen.dart';
import 'result_screen.dart';
import 'data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start-screen';
  Widget? screenWidget;

  final List<String> selectedAnswers = [];

  void addSelectedAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    activeScreen = 'start-screen';
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'question-screen';
      selectedAnswers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (activeScreen == 'start-screen') {
      screenWidget = StartScreen(switchScreen);
    } else if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(addSelectedAnswer);
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(restartQuiz: restartQuiz, selectedAnswers: selectedAnswers);
    }

    final home = Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color.fromARGB(255, 70, 15, 109), Color.fromARGB(255, 90, 20, 255)]),
        ),
        child: screenWidget,
      ),
    );

    return MaterialApp(home: home);
  }
}
