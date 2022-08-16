import 'dart:async';
import 'dart:math' as math;
import 'dart:math';
import 'package:clock_app/topNavBar.dart';
import 'package:flutter/material.dart';

class AnalogClock extends StatefulWidget {
  const AnalogClock({Key? key}) : super(key: key);

  @override
  State<AnalogClock> createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  @override
  void initState() {
    // ignore: unused_local_variable
    Timer mytimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const TopNavBar(),
          Container(
            height: size.height * .6,
            width: size.width,
            alignment: Alignment.center,
            color: Colors.amber,
            child: Transform.rotate(
              angle: -math.pi / 2,
              child: CustomPaint(
                size: size,
                painter: ClockPainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = const Color(0xFF444974);

    canvas.drawCircle(center, radius, fillBrush);

    // Draws the clock hour hand

    var hourHandBrush = Paint()
      ..shader = const RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 18
      ..strokeCap = StrokeCap.round;

    /// Draws the clock minute hand

    var minHandBrush = Paint()
      ..shader = const RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14
      ..strokeCap = StrokeCap.round;

    /// Draws the clock second hand

    var secHandBrush = Paint()
      ..shader = const RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    var secHandX = centerX + 170 * cos((math.pi * dateTime.second * 6) / 180);
    var secHandY = centerY + 170 * sin((math.pi * dateTime.second * 6) / 180);

    var minHandX = centerX + 140 * cos((math.pi * dateTime.minute * 6) / 180);
    var minHandY = centerY + 140 * sin((math.pi * dateTime.minute * 6) / 180);

    var hourHandX = centerX +
        100 *
            cos((math.pi * (dateTime.hour * 30 + dateTime.minute * .5)) / 180);
    var hourHandY = centerY +
        100 *
            sin((math.pi * (dateTime.hour * 30 + dateTime.minute * .5)) / 180);

    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);
  }
}

extension on num {
  /// This is an extension we created so we can easily convert a value  /// to a radian value
  // ignore: unused_element
  double get radians => (this * math.pi) / 180.0;
}
