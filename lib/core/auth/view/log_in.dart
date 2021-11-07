import 'package:flutter/material.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/commons/notifications/notifications.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/base/base_page.dart';
import 'package:src/widgets/button/fill_button.dart';
import 'package:src/widgets/button/non_fill_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/widgets/input_field/text_form_field.dart';

class LoginPage extends StatefulWidget {
  final Function callBack;

  const LoginPage({Key? key, required this.callBack}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  late TextEditingController _phoneController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _phoneController = new TextEditingController();
    _passwordController = new TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Column(children: [
            _buildFormField(),
            Expanded(child: Container()),
            _buildBottomField()
          ]),
        ),
      )
    ]);
  }

  Widget _buildFormField() {
    return Form(
      key: _formKey,
      child: Column(children: [
        TextFormFieldWidget.phoneNumber(context, _phoneController),
        SizedBox(height: 24.h),

        TextFormFieldWidget.password(context, _passwordController),
        SizedBox(height: 44.h),
        GestureDetector(
          onTap: () {
            //forgot pass
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: getCustomColor().primary,
                    width: 1.5.w // Underline thickness
                    ),
              ),
            ),
            child: Text(
              S.current.forgot_password,
              style: Theme.of(context).textTheme.caption!.copyWith(
                  color: getCustomColor().primary, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildBottomField() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(top: 8.h),
        child: Column(children: [
          FillButton(
            width: 198.w,
            buttonText: S.current.sign_in,
            onPressed: () {
              pushReplacement(HomePageScreen(), context);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.current.dont_have_account,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: getCustomColor().black),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () => widget.callBack(1),
                    child: Text(
                      S.current.sign_up,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: getCustomColor().primary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}