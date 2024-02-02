import 'package:flutter/material.dart';

class SnowMan extends StatefulWidget {
  const SnowMan({super.key});

  @override
  State<SnowMan> createState() => _SnowManState();
}

class _SnowManState extends State<SnowMan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
            painter: SnowManWidget(
            ),
          ),
      )
    );
  }
}

class SnowManWidget extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // Head
    canvas.drawCircle(const Offset(0, -40), 40, Paint()..color = Colors.lightBlueAccent);
    // Middle Head
    canvas.drawCircle(const Offset(0, 45), 55, Paint()..color = Colors.lightBlueAccent);
    // Bottom Head
    canvas.drawCircle(const Offset(0, 160), 70, Paint()..color = Colors.lightBlueAccent);

    //Left eye
    canvas.drawCircle(const Offset(-15, -55), 5, Paint()..color = Colors.black);
    //Right eye
    canvas.drawCircle(const Offset(15, -55), 5, Paint()..color = Colors.black);
    //Nose
    canvas.drawCircle(const Offset(0, -38), 5, Paint()..color = Colors.orange);
    canvas.drawCircle(const Offset(6, -38), 4, Paint()..color = Colors.orange);
    canvas.drawCircle(const Offset(8, -38), 3, Paint()..color = Colors.orange);
    canvas.drawCircle(const Offset(10, -38), 2, Paint()..color = Colors.orange);
    canvas.drawCircle(const Offset(11, -38), 1, Paint()..color = Colors.orange);
    //Mouth
    canvas.drawCircle(const Offset(13, -20), 3, Paint()..color = Colors.black);
    canvas.drawCircle(const Offset(8, -16), 3, Paint()..color = Colors.black);
    canvas.drawCircle(const Offset(3, -14), 3, Paint()..color = Colors.black);
    canvas.drawCircle(const Offset(-3, -14), 3, Paint()..color = Colors.black);
    canvas.drawCircle(const Offset(-8, -16), 3, Paint()..color = Colors.black);
    canvas.drawCircle(const Offset(-13, -20), 3, Paint()..color = Colors.black);
    // left and right hand
    canvas.drawCircle(const Offset(-60, 25), 20, Paint()..color = Colors.lightBlueAccent);
    canvas.drawCircle(const Offset(60, 25), 20, Paint()..color = Colors.lightBlueAccent);
    // left and right legs
    canvas.drawCircle(const Offset(50, 220), 25, Paint()..color = Colors.lightBlueAccent);
    canvas.drawCircle(const Offset(-50, 220), 25, Paint()..color = Colors.lightBlueAccent);
    //Button
    canvas.drawCircle(const Offset(0, 15), 5, Paint()..color = Colors.black);
    canvas.drawCircle(const Offset(0, 40), 5, Paint()..color = Colors.black);
    canvas.drawCircle(const Offset(0, 65), 5, Paint()..color = Colors.black);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}