import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class BuildAnimation extends StatefulWidget {
  @override
  _BuildAnimationState createState() => _BuildAnimationState();
}

class _BuildAnimationState extends State<BuildAnimation>
    with SingleTickerProviderStateMixin {
  Tween<double> _scaleTween = Tween<double>(begin: 1, end: 3);
  AnimationController controller;
  AnimationController animationController;
  SequenceAnimation sequenceAnimation;
  SequenceAnimation sequenceAnimation2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 20, end: 174),
            from: Duration(seconds: 1),
            to: Duration(seconds: 2),
            tag: 'size')
        .addAnimatable(
            animatable: Tween<double>(begin: 174, end: 136),
            from: Duration(seconds: 2),
            to: Duration(milliseconds: 2500),
            tag: 'size')
        .addAnimatable(
            animatable: Tween<double>(begin: 136, end: 174),
            from: Duration(milliseconds: 2500),
            to: Duration(seconds: 3),
            tag: 'size')
        .animate(controller);

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    sequenceAnimation2 = SequenceAnimationBuilder()
        .addAnimatable(animatable: , from: null, to: null, tag: null)
        .animate(animationController);
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget child) {
            return Container(
              width: sequenceAnimation["size"].value,
              height: sequenceAnimation["size"].value,
              decoration: BoxDecoration(
                color: Color(0xff7900FF),
                borderRadius: BorderRadius.circular(
                  sequenceAnimation["size"].value,
                ),
              ),
            );
          },
          child: AnimatedBuilder(animation: null, builder: null),
        ),
      ),
    );
  }
}
