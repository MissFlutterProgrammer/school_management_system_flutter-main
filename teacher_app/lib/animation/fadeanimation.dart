import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget widgetChild;
  static final testOpacity = MovieTweenProperty<double>();
  static final testTranslateY = MovieTweenProperty<double>();
  static final tween = MovieTween()
    ..scene(
      begin: const Duration(seconds: 0),
      duration: const Duration(milliseconds: 500),
    ).tween(
      testOpacity,
      Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOut,
    )
    ..scene(
      begin: const Duration(seconds: 0),
      duration: const Duration(milliseconds: 500),
    ).tween(
      testTranslateY,
      Tween(begin: -30.0, end: 0.0),
      curve: Curves.easeOut,
    );

  const FadeAnimation(
      {super.key, required this.delay, required this.widgetChild});

  @override
  Widget build(BuildContext context) {
    return CustomAnimationBuilder(
      tween: tween,
      control: Control.play,
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      builder: (context, value, child) {
        return Opacity(
          opacity: testOpacity.from(
            value,
          ),
          child: Transform.translate(
            offset: Offset(
                0,
                testTranslateY.from(
                  value,
                )),
            child: widgetChild,
          ),
        );
      },
    );
  }
}
