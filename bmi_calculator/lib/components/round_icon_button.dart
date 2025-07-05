import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, this.onPressed, super.key});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      fillColor: kButtonColor,
      shape: CircleBorder(),
      onPressed: onPressed,
      child: Icon(icon, color: Colors.white),
    );
  }
}