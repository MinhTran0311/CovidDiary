import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/widgets/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/widgets/button/fill_button.dart';
import 'package:src/widgets/button/ghost_button.dart';
import 'package:src/widgets/panel.dart';
import 'checkbox.dart';

class HealthDeclaration extends StatefulWidget {
  const HealthDeclaration({Key? key}) : super(key: key);

  @override
  _HealthDeclarationState createState() => _HealthDeclarationState();
}

class _HealthDeclarationState extends State<HealthDeclaration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        hasReturnIcon: false,
        context: context,
        title: S.current.health_declaration_app_bar_title,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(children: [
          _buildFirstForm(),
          SizedBox(height: 16.h),
          _buildSecondForm(),
          SizedBox(height: 16.h),
          _buildButtons(),
        ]),
      ),
    );
  }

  Widget _buildFirstForm() {
    return PanelLight(
      child: Column(children: [
        Text(
          S.current.health_declaration_first_question,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: getCustomColor().secondary),
        ),
        SizedBox(height: 8.h),
        Row(mainAxisSize: MainAxisSize.max, children: [
          Expanded(child: CheckBox(text: S.current.symptom_name_2)),
          SizedBox(width: 8.w),
          Expanded(child: CheckBox(text: S.current.symptom_name_9)),
        ]),
        Row(mainAxisSize: MainAxisSize.max, children: [
          Expanded(child: CheckBox(text: S.current.symptom_name_1)),
          SizedBox(width: 8.w),
          Expanded(child: CheckBox(text: S.current.symptom_name_6)),
        ]),
        Row(mainAxisSize: MainAxisSize.max, children: [
          Expanded(child: CheckBox(text: S.current.symptom_name_3)),
          SizedBox(width: 8.w),
          Expanded(child: CheckBox(text: S.current.symptom_name_10)),
        ]),
        Row(mainAxisSize: MainAxisSize.max, children: [
          Expanded(child: CheckBox(text: S.current.symptom_name_5)),
          SizedBox(width: 8.w),
          Expanded(child: CheckBox(text: S.current.symptom_name_11)),
        ]),
        Row(mainAxisSize: MainAxisSize.max, children: [
          Expanded(child: CheckBox(text: S.current.symptom_name_12, hasBottomMargin: false)),
          SizedBox(width: 8.w),
          Expanded(child: CheckBox(text: S.current.symptom_name_8, hasBottomMargin: false)),
        ])
      ]),
    );
  }

  Widget _buildSecondForm() {
    return PanelLight(
      child: Column(children: [
        Text(
          S.current.health_declaration_second_question,
          textAlign: TextAlign.left,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: getCustomColor().secondary),
        ),
        SizedBox(height: 8.h),
        CheckBox(text: S.current.health_declaration_covid_patient),
        CheckBox(text: S.current.health_declaration_nations),
        CheckBox(
            text: S.current.health_declaration_symptom, hasBottomMargin: false),
      ]),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        GhostButton(
            buttonText: S.current.health_declaration_do_again,
            onPressed: () {},
            width: 176.w),
        FillButton(
            buttonText: S.current.confirm,
            onPressed: () {},
            width: 176.w,
            buttonColor: getCustomColor().secondary)
      ],
    );
  }
}
