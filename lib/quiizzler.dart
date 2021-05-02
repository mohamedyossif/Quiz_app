import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:quizzler_app/questionBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Quizzler extends StatefulWidget {
  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  QuestionBank _questionBank = QuestionBank();
  List<Icon> _scoreKeeper = [];
  AudioCache _audioCached = AudioCache();

  void checkQuestionNumber(bool check) {
    if (check == _questionBank.getQuestionAnser()) {
      _scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
          size: 30,
        ),
      );
      _audioCached.play('au.mp3');
    } else {
      _scoreKeeper.add(Icon(
        Icons.close,
        color: Colors.red,
        size: 30,
      ));
    }
    setState(() {
      _questionBank.nextQuestion();
    });
    if (_scoreKeeper.length == _questionBank.questionBankLength) {
      Alert(
              buttons: [
            DialogButton(
              child: Text(
                "Play again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _questionBank.questionNumberSetter = 0;
                  _scoreKeeper.clear();
                });
              },
            ),
            DialogButton(
              color: Colors.grey,
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
              context: context,
              title: "Finished !",
              desc: "You have reached the end of the questions")
          .show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              "Q${_questionBank.questionNumberGetter + 1}: ${_questionBank.getQuestion()} ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                checkQuestionNumber(true);
              },
              child: Text("True"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 30))),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                checkQuestionNumber(false);
              },
              child: Text(
                "False",
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 30))),
            ),
          ),
        ),
        Wrap(
          children: [Row(children: _scoreKeeper)],
        )
      ],
    );
  }
}
