import 'package:flutter/material.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR',
          style: TextStyle(color: kAppBarTextColor),
        ),
      ),
      body: Text('Hello'),
    );
  }
}
