import 'dart:async';

import 'package:flutter/material.dart';

class BallProp {
  double xPosition = 0.0;
  double yPosition = 0.0;
  double xVelocity = 3.0;
  double yVelocity = 2.0;
}

class BouncingBox2 extends StatefulWidget {
  const BouncingBox2({
    super.key,
    required this.maxHeight,
    required this.maxWidth,
    this.isAnimating = false,
  });
  @override
  State<BouncingBox2> createState() => _BouncingBox2State();
  final double maxHeight, maxWidth;
  final bool isAnimating;
}

class _BouncingBox2State extends State<BouncingBox2> {
  double size = 128;
  int slowness = 32;

  ValueNotifier<BallProp> prop = ValueNotifier(BallProp());
  late final Timer? timer;
  @override
  void initState() {
    timer = widget.isAnimating
        ? Timer.periodic(Duration(milliseconds: slowness), (timer) {
            updateProp();
          })
        : null;
    super.initState();
  }

  void delayedUpdateProp() async {
    updateProp();

//    await Future.delayed(Duration(milliseconds:slowness),updateProp);
  }

  void updateProp() {
    BallProp newProp = prop.value;
    newProp.xPosition += newProp.xVelocity;
    newProp.yPosition += newProp.yVelocity;
    if (newProp.xPosition <= -(size / 2) || newProp.xPosition >= widget.maxWidth - (size / 2)) {
      newProp.xVelocity = -newProp.xVelocity;
    }
    if (newProp.yPosition <= -(size / 2) || newProp.yPosition >= widget.maxHeight - (size / 2)) {
      newProp.yVelocity = -newProp.yVelocity;
    }
    prop.value = newProp;
    setState(() {});
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: slowness),
          curve: Curves.bounceInOut,
          right: prop.value.xPosition,
          top: prop.value.yPosition,
          child: Transform(
            transform: Matrix4.identity()
              ..translate(0.0, 0.0)
              ..rotateZ(0.52),
            child: SizedBox(
              width: size,
              height: size,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.07999999821186066),
//                     shape: BoxShape.circle
                ),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: slowness),
          curve: Curves.bounceInOut,
          left: prop.value.xPosition,
          bottom: prop.value.yPosition,
          child: Transform(
            transform: Matrix4.identity()
              ..translate(0.0, 0.0)
              ..rotateZ(0.52),
            child: SizedBox(
              width: size,
              height: size,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.07999999821186066),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
