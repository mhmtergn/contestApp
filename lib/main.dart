import 'package:flutter/material.dart';
import 'constants.dart';
import './data.dart';

void main() => runApp(Contest());

class Contest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuestionPage(),
          ),
        ),
      ),
    );
  }
}

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Widget> choices = [];

  int score = 0;

  Data test_1 = Data();

  void buttonFunc(bool correctAnswer) {
    if (test_1.isTestDone() == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Your Score',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            content: Text(
              score.toString(),
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      test_1.testStartAgain();
                      choices = [];
                      score = 0;
                    });
                  },
                  child: const Text('Reset'))
            ],
          );
        },
      );
    }
    setState(() {
      test_1.nextQuestion();
      test_1.getAnswers() == correctAnswer
          ? choices.add(kWrongIcon)
          : choices.add(kRightIcon);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getQuestions(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        Wrap(
          runSpacing: 10,
          spacing: 10,
          children: choices,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(vertical: 30),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    buttonFunc(false);
                    if (test_1.getAnswers() == false) {
                      score++;
                    }
                  },
                  child: Icon(
                    Icons.thumb_down,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: OutlinedButton(
                  style:
                      OutlinedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    buttonFunc(true);
                    if (test_1.getAnswers() == true) {
                      score++;
                    }
                  },
                  child: Icon(
                    Icons.thumb_up,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
