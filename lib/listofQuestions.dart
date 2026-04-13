import 'package:flutter/material.dart';

import 'question.dart';

class Listofquestions {
  int _questionNumber = 0;

  List<Question> _questionGroup = [
    Question(
      "Number of planets in our solar system are 8?",
      'images/image-1.jpg',
      true,
    ),

    Question("Cats are mammals?", 'images/image-2.jpg', true),

    Question(
      "China is the largest country in the world?",
      'images/image-3.jpg',
      false,
    ),
    Question(
      "Earth is the third planet from the Sun?",
      'images/image-4.jpg',
      true,
    ),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionGroup.length - 1) {
      _questionNumber = _questionNumber + 1;
    }
  }

  String getQuestionText() {
    return _questionGroup[_questionNumber].questionText;
  }

  String getQuestionImage() {
    return _questionGroup[_questionNumber].questionImage;
  }

  bool getQuestionAnswer() {
    return _questionGroup[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionGroup.length - 1) {
      print('Finished');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
