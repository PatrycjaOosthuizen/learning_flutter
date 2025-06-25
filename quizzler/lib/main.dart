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
  List<Icon> scoreKeeper = []; // Icons for tracking score visually
  int questionNumber = 0; // Current question index

  bool quizFinished = false; // Whether quiz is completed
  int correctAnswers = 0; // Track number of correct answers

  // Function to check the user's answer and update score/state
  void checkAnswer(bool userPickedAnswer) {
    if (quizFinished) return;

    // Get the correct answer from quiz logic
    bool correctAnswer = quizBrain.getQuestionAnswer(questionNumber);

    setState(() {
      // Compare user's answer with correct answer
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        correctAnswers++; // Increment score if correct
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

  // Reset quiz state to replay
  void restartQuiz() {
    setState(() {
      questionNumber = 0;
      correctAnswers = 0; // Reset correct answers
      scoreKeeper = []; // Clear score icons
      quizFinished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return quizFinished
    // Show this UI when quiz is finished
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
            'Your score was $correctAnswers / ${quizBrain.totalQuestions}', // Show score
            style: TextStyle(fontSize: 20.0, color: Colors.white70),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: restartQuiz,
            child: Text('Restart Quiz'), // Button to restart quiz
          ),
        ],
      ),
    )
        // Show quiz questions and answers when quiz is active
        : Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Question text area
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
        // True button
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
        // False button
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
        // Row showing score icons
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
