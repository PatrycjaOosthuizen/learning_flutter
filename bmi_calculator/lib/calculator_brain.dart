import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  late double _bmi;  //private value

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >=25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Narmal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Whoa! Looks like your body is prepping for winter early. Maybe ease up on the snacks and try dancing like no one’s watching — just make sure no furniture gets hurt.';
    } else if (_bmi >= 18.5) {
      return 'Perfect! You’re like the Goldilocks of body weight — not too much, not too little. Just right.';
    } else {
      return 'You might float away in a strong breeze! Grab a burger or two and join the land of gravity.';
    }
  }
}
