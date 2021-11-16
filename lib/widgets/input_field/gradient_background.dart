import 'package:flutter/material.dart';
import 'package:src/commons/themes/theme.dart';

class GradientBackGround extends StatelessWidget {
  final Widget child;
  const GradientBackGround({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getCustomColor().primary,
              getCustomColor().primary,
              getCustomColor().white
            ]),
      ),
      child: child,
    );
  }
}
