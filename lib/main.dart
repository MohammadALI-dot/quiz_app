import 'package:flutter/material.dart';
import 'question.dart';
import 'listofQuestions.dart';

Listofquestions listQuestions = Listofquestions();

void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(backgroundColor: Colors.grey, title: Text('Quiz App')),
        body: Padding(padding: const EdgeInsets.all(25.0), child: ExamPage()),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerResults = [];

  Listofquestions listQuestions = Listofquestions();
  int correctAnswers = 0;
  void checkAnswer(bool userAnswer) {
    bool correctAnswer = listQuestions.getQuestionAnswer();
    setState(() {
      if (userAnswer == correctAnswer) {
        correctAnswers++;
        answerResults.add(
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(Icons.thumb_up, color: Colors.green),
          ),
        );
      } else {
        answerResults.add(
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(Icons.thumb_down, color: Colors.red),
          ),
        );
      }
      if (listQuestions.isFinished()) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Finished'),
              content: Text(
                'You reached the end of the quiz! You got $correctAnswers correct answers.',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      listQuestions.reset();
                      answerResults.clear();
                      correctAnswers = 0;
                    });
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        listQuestions.nextQuestion();
      }
    });
  }

  // List<String> questions = [
  //   "Number of planets in our solar system are 8?",
  //   "Cats are mammals?",
  //   "China is the largest country in the world?",
  //   "Earth is the third planet from the Sun?",
  // ];

  // List<String> images = [
  //   'images/image-1.jpg',
  //   'images/image-2.jpg',
  //   'images/image-3.jpg',
  //   'images/image-4.jpg',
  // ];

  // List<bool> answers = [true, true, false, true];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: answerResults),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(listQuestions.getQuestionImage()),
              SizedBox(height: 80),
              Text(
                listQuestions.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // text color
                backgroundColor: Colors.blue, // button color
              ),
              child: Text("True"),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // text color
                backgroundColor: const Color.fromARGB(
                  255,
                  243,
                  33,
                  54,
                ), // button color
              ),
              child: Text("false"),
            ),
          ),
        ),
      ],
    );
  }
}
