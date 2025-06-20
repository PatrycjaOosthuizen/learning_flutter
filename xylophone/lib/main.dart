import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded buildKey({required Color color, required int sound, required String label}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(sound);
        },
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: Colors.red, sound: 1, label: 'Do'),
              buildKey(color: Colors.orange, sound: 2, label: 'Re'),
              buildKey(color: Colors.yellow, sound: 3, label: 'Mi'),
              buildKey(color: Colors.green, sound: 4, label: 'Fa'),
              buildKey(color: Colors.teal, sound: 5, label: 'So'),
              buildKey(color: Colors.blue, sound: 6, label: 'La'),
              buildKey(color: Colors.purple, sound: 7, label: 'Ti'),
            ],
          ),
        ),
      ),
    );
  }
}
