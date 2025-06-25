import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int questionNumber = 0;
  bool quizFinished = false;
  int correctAnswers = 0; // Track number of correct answers

  void checkAnswer(bool userPickedAnswer) {
    if (quizFinished) return;

    bool correctAnswer = quizBrain.getQuestionAnswer(questionNumber);

    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        correctAnswers++; // Increment on correct answer
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }

      if (questionNumber < quizBrain.totalQuestions - 1) {
        questionNumber++;
      } else {
        quizFinished = true;
      }
    });
  }

  void restartQuiz() {
    setState(() {
      questionNumber = 0;
      correctAnswers = 0; // Reset correct answers
      scoreKeeper = [];
      quizFinished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return quizFinished
        ? Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Quiz Finished!',
            style: TextStyle(fontSize: 28.0, color: Colors.white),
          ),
          SizedBox(height: 10.0),
          Text(
            'Your score was $correctAnswers / ${quizBrain.totalQuestions}', // 🆕 Show score
            style: TextStyle(fontSize: 20.0, color: Colors.white70),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: restartQuiz,
            child: Text('Restart Quiz'),
          ),
        ],
      ),
    )
        : Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(questionNumber),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: Text('True', style: TextStyle(fontSize: 20.0)),
              onPressed: () => checkAnswer(true),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text('False', style: TextStyle(fontSize: 20.0)),
              onPressed: () => checkAnswer(false),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
