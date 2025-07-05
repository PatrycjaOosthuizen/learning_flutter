import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({required this.colour, this.cardChild, this.onPress, super.key});

  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: cardChild,
      ),
    );
  }
}
