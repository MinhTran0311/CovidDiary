import 'dart:ffi';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';

OpenContainer openContainer(Widget closed, Widget open, [int animTime = 700]) {
  return OpenContainer(
      transitionDuration: Duration(milliseconds: animTime),
      transitionType: ContainerTransitionType.fade,
      closedBuilder: (context, action) {
        return closed;
      },
      openBuilder: (context, action) {
        return open;
      });
}
