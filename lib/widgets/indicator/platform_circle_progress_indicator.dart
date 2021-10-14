import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../platformWidget.dart';

class PlatformCircleIndicator extends PlatformWidget
<CupertinoActivityIndicator,
    CircularProgressIndicator> {
  PlatformCircleIndicator(
      {this.key, this.backgroundColor, this.color, this.valueColor});

  final Key? key;
  final Color? backgroundColor;
  final Color? color;
  final Animation<Color?>? valueColor;

  @override
  CircularProgressIndicator createAndroidWidget(BuildContext context) {
    return CircularProgressIndicator(
      key: key,
      backgroundColor: this.backgroundColor,
      color: this.color,
      valueColor: this.valueColor,
    );
  }

  @override
  CupertinoActivityIndicator createIosWidget(BuildContext context) {
    return CupertinoActivityIndicator(key: key);
  }
}
