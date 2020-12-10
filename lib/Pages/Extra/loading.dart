import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:math' as math;

class loading1 extends StatefulWidget {
  Color color;
  loading1({Key key,@required this.color}):super(key: key);
  @override
  _loading1State createState() => _loading1State();
}

class _loading1State extends State<loading1> with TickerProviderStateMixin{

  AnimationController animationController;
  Animation animation;
  Tween tween;
  bool isclockwise = true;
  Color fill;

  doanimation(double begin, double end){
    return tween.animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(begin, end,curve: Curves.linear),
    ));
  }

  brick(bool isclock,double begin1,double end1,double begin2,double end2){
    animation = doanimation(begin1, end1);
    Animation anim = doanimation(begin2, end2);
    animation.addListener(() {setState(() {});});
    anim.addListener(() {setState(() {});});

    return Transform(
      transform: isclock
          ?Matrix4.rotationZ(animation.value * math.pi * 2.0 * 0.5)
          :Matrix4.rotationZ(-(animation.value * math.pi * 2.0 * 0.5)),
      alignment: Alignment.centerRight,
      child: Transform(
        transform: isclock
            ?Matrix4.rotationZ(anim.value * math.pi * 2.0 * 0.5)
            :Matrix4.rotationZ(-(anim.value * math.pi * 2.0 * 0.5)),
        alignment: Alignment.centerRight,
        child: Container(
          height: 10.0,
          width: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: fill,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fill = widget.color;
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 5));
    tween = Tween<double>(begin: 0.0, end: 1.0);
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            brick(true,0.0, 0.1, 0.9, 1.0),
            brick(false,0.1, 0.2, 0.8, 0.9),
            brick(true,0.2, 0.3, 0.7, 0.8),
            brick(false,0.3, 0.4, 0.6, 0.7),
            brick(true,0.4, 0.5,0.5, 0.6),
          ],
        ));
  }
}