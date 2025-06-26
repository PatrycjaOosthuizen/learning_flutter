import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0XFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget> [
              Expanded(child: ReusableCard(colour: activeCardColor,),
              ),
              Expanded(child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: activeCardColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),),
            ],
          ),),
          Expanded(child: ReusableCard(colour: activeCardColor,),
          ),
          Expanded(child: Row(
            children: <Widget> [
              Expanded(child: ReusableCard(colour: activeCardColor,),
              ),
              Expanded(child: ReusableCard(colour: activeCardColor,),
              ),
            ],
          ),),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top:10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({ required this.colour, super.key});

  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
