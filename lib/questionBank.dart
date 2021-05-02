import 'package:quizzler_app/question.dart';

class QuestionBank {
  int _questionNumber = 0;
  List<Question> _questionsBank = [];
  QuestionBank() {
    _questionsBank.add(
        Question('the five rings on the Olympic flag are interlocking?', true));
    _questionsBank.add(Question(
        'Mount Kilimanjaro is the highest mountain in the world?', false));
    _questionsBank.add(Question(
        'Strictly Come Dancing first aired in the UK in 2005?', false));
    _questionsBank.add(Question('a group of swans is known as a bevy?', true));
    _questionsBank.add(Question('Sydney is the capital of Australia?', false));
    _questionsBank
        .add(Question('the Penny Black is an old-fashioned coin?', false));
    _questionsBank.add(Question(
        'Glastonbury had been due to celebrate its 50th anniversary in June before the festival was cancelled?',
        true));
    _questionsBank.add(Question(
        'Will.i.am is the only mentor to have appeared on every single series of The Voice UK?',
        true));
    _questionsBank.add(Question('a heptagon has eight sides?', false));
    _questionsBank.add(Question('fish cannot blink?', true));
    _questionsBank.add(Question('seahorses have no teeth or stomach?', true));
    _questionsBank.add(Question(
        'the knight is the only piece in chess which can only move diagonally?',
        false));
    _questionsBank.add(Question(
        'Nepal is the only country in the world which does not have a rectangular flag?',
        true));
  }
  int get questionBankLength => _questionsBank.length;
  String getQuestion() {
    return _questionsBank[_questionNumber].question;
  }

  bool getQuestionAnser() {
    return _questionsBank[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionsBank.length - 1) {
      _questionNumber++;
    }
  }
  int get questionNumberGetter =>_questionNumber;
  void set questionNumberSetter(int index)
  {
    _questionNumber=index;
  }
}
