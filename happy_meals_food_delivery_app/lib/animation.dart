import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class BuildAnimation extends StatefulWidget {
  @override
  _BuildAnimationState createState() => _BuildAnimationState();
}

class _BuildAnimationState extends State<BuildAnimation>
    with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController animationController;
  AnimationController animationController3;
  SequenceAnimation sequenceAnimation3;
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
            animatable: Tween<double>(begin: 15, end: 174),
            from: Duration(seconds: 0),
            to: Duration(milliseconds: 1200),
            tag: 'size')
        .addAnimatable(
            animatable: Tween<double>(begin: 174, end: 136),
            from: Duration(milliseconds: 1200),
            to: Duration(milliseconds: 1600),
            tag: 'size')
        .addAnimatable(
            animatable: Tween<double>(begin: 136, end: 174),
            from: Duration(milliseconds: 1600),
            to: Duration(milliseconds: 2000),
            tag: 'size')
        .animate(controller);

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    sequenceAnimation2 = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 70, end: 76),
            from: Duration(milliseconds: 0000),
            to: Duration(milliseconds: 1600),
            tag: 'size2')
        .addAnimatable(
            animatable: new Tween<double>(begin: 0.0, end: 1.0),
            from: Duration(milliseconds: 400),
            to: Duration(milliseconds: 1600),
            curve: Curves.ease,
            tag: "opacity")
        .animate(animationController);

    animationController3 =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    sequenceAnimation3 = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 40, end: 70),
            from: Duration(milliseconds: 0000),
            to: Duration(milliseconds: 1000),
            tag: 'size2')
        .addAnimatable(
            animatable: new Tween<double>(begin: 0.0, end: 0.3),
            from: Duration(milliseconds: 000),
            to: const Duration(milliseconds: 1500),
            curve: Curves.ease,
            tag: "opacity")
        .addAnimatable(
            animatable: new Tween<double>(begin: 0.3, end: 0.0),
            from: Duration(milliseconds: 1500),
            to: const Duration(milliseconds: 1600),
            curve: Curves.ease,
            tag: "opacity")
        .animate(animationController3);

    controller.forward();
    animationController.forward();
    animationController3.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    animationController.dispose();
    animationController3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Center(
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
              ),
            ),
            Center(
              child: AnimatedBuilder(
                  animation: animationController,
                  builder: (BuildContext context, Widget child) {
                    return Icon(
                      Icons.check,
                      color: Colors.white.withOpacity(
                        sequenceAnimation2["opacity"].value,
                      ),
                      size: sequenceAnimation2["size2"].value,
                    );
                  }),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 19, top: 23.5),
                child: AnimatedBuilder(
                  animation: animationController3,
                  builder: (BuildContext context, Widget child) {
                    return Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white.withOpacity(
                        sequenceAnimation3["opacity"].value,
                      ),
                      size: sequenceAnimation3["size2"].value,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
