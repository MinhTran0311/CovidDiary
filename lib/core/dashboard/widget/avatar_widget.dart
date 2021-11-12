import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/custom_colors.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/widgets/rounded_avatar.dart';

class DBAvatarWidget extends StatelessWidget {
  const DBAvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          RoundAvatar(path: "assets/svg/avatar.png"),
          SizedBox(width: 8),
          _helloPanel(context)
        ],
      ),
    );
  }

  Widget _helloPanel(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.dashboard_hello + ",",
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w600, color: getCustomColor().white),
        ),
        Text(
          S.current.dashboard_def_username.toUpperCase(),
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headline5!.copyWith(
              fontWeight: FontWeight.w600, color: getCustomColor().white),
        ),
      ],
    ));
  }
}
