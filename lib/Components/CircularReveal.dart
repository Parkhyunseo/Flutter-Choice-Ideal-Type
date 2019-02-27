import 'package:flutter/material.dart';
import 'dart:math';

class CircularReveal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CircularRevealState();
}

class _CircularRevealState extends State<CircularReveal>
    with TickerProviderStateMixin {
  
  Animation<double> _animation;
  AnimationController _controller;
  double _fraction = 0.0;

  @override
  Widget build(BuildContext context){
    return CustomPaint(
      painter: CircularRevealPainter(_fraction, MediaQuery.of(context).size),
    );
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  dispose(){
    _controller.dispose();
    super.dispose();
  }

  void reveal(){
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200), 
      vsync: this
    );
    _animation = Tween(begin: 0.0, end:1.0).animate(_controller)
    ..addListener((){
      setState((){
        _fraction =_animation.value;
      });
    });

    _controller.forward();
  }
}

class CircularRevealPainter extends CustomPainter{
  double _fraction = 0.0;
  Size _screenSize;

  CircularRevealPainter(this._fraction, this._screenSize);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.green
      ..style =PaintingStyle.fill;

    var finalRadius = sqrt(
      pow(_screenSize.width / 2, 2) + 
      pow(_screenSize.height / 2, 2)
    );

    var radius = 24.0 + finalRadius + _fraction;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(CircularRevealPainter oldDelegate){
    return oldDelegate._fraction !=_fraction;
  }
}