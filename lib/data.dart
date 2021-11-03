import 'package:bilgi_yarismasi/questions.dart';

class Data {
  int questionIndex = 0;
  List<Questions> _questionBank = [
    Questions(
      question: 'Titanic gelmis gecmis en buyuk gemidir.',
      answer: false,
    ),
    Questions(
      question: 'Dunyadaki tavuk sayisi insan sayisindan fazladir',
      answer: true,
    ),
    Questions(
      question: 'Kelebeklerin omru bir gundur',
      answer: false,
    ),
    Questions(
      question: 'Dunya duzdur.',
      answer: false,
    ),
    Questions(
      question: 'Kahu fistigi aslinda bir meyvenin sapidir',
      answer: true,
    ),
    Questions(
      question: 'Fatih Sultan Mehmet hic patates yememistir.',
      answer: true,
    ),
  ];

  String getQuestions() {
    return _questionBank[questionIndex].question!;
  }

  bool? getAnswers() {
    return _questionBank[questionIndex].answer;
  }

  nextQuestion() {
    if (questionIndex < _questionBank.length - 1) {
      questionIndex++;
    }
  }

  bool isTestDone() {
    if (questionIndex >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void testStartAgain() {
    questionIndex = 0;
  }
}
