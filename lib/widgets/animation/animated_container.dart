import 'dart:ffi';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';

OpenContainer animatedContainer(Widget closed, Widget open,
    [int animTime = 1]) {
  return OpenContainer(
      transitionDuration: Duration(seconds: animTime),
      transitionType: ContainerTransitionType.fade,
      closedBuilder: (context, action) {
        return closed;
      },
      openBuilder: (context, action) {
        return open;
      });
}
