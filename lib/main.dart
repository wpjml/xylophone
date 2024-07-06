import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Future<void> playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(
      AssetSource('note$soundNumber.wav'),
    );
    await player.setVolume(0.5);
  }

  Expanded buildkey(Color color, int playsoundNumber) {
    return Expanded(
      child: Container(
        color: color,
        width: double.infinity,
        height: 50.0,
        child: GestureDetector(onTap: () async {
          playSound(playsoundNumber);
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              buildkey(Colors.red, 1),
              buildkey(Colors.orange, 2),
              buildkey(Colors.yellow, 3),
              buildkey(Colors.green[800]!, 4),
              buildkey(Colors.teal[900]!, 5),
              buildkey(Colors.blueAccent, 6),
              buildkey(Colors.purple[800]!, 7),
            ],
          ),
        ),
      ),
    );
  }
}
