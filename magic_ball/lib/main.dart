import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // hides the DEBUG banner
    home: BallPage()));

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('Ask Me Anything'),
        foregroundColor: Colors.white,
      ),
      body: Ball(),
    );
  }
}

// A StatefulWidget that displays a ball image which changes randomly when tapped
class Ball extends StatefulWidget {
  @override
  State<Ball> createState() => _BallState();
}

// The state class that manages the current ball image
class _BallState extends State<Ball> {
  // Holds the current ball number (1 to 5)
  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      // TextButton wraps the image so it can be tapped
    child: TextButton(
      // When tapped, update ballNumber to a random value between 1 and 5
        onPressed: () {
          setState(() {
            ballNumber = Random().nextInt(5) + 1;
          });
        },
      // Load and display the image based on the current ball number
        child: Image.asset('images/ball$ballNumber.png'),
      ),
    );
  }
}
