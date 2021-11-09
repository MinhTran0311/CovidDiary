import 'package:flutter/material.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/widgets/button/fill_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/widgets/input_field/text_form_field.dart';

class SignUpPage extends StatefulWidget {
  final Function callBack;

  const SignUpPage({Key? key, required this.callBack}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _phoneController = new TextEditingController();
    _passwordController = new TextEditingController();
    _confirmPasswordController = new TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(children: [
            _buildFormField(),
            Expanded(child: Container()),
            _buildBottomField()
          ]),
        )
      ]),
    );
  }

  Widget _buildFormField() {
    return Form(
      key: _formKey,
      child: Column(children: [
        TextFormFieldWidget.phoneNumber(context, _phoneController),
        SizedBox(height: 24.h),
        TextFormFieldWidget.password(context, _passwordController),
        SizedBox(height: 24.h),
        TextFormFieldWidget.confirmPassword(context, _confirmPasswordController,
            label: S.current.confirm_password_input,
            hint: S.current.confirm_password_hint,
            passwordController: _passwordController),
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
            buttonText: S.current.sign_up,
            onPressed: () {
              _submit();
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
                    S.current.have_an_account,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: getCustomColor().black),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () => widget.callBack(0),
                    child: Text(
                      S.current.sign_in,
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

  void _submit() async {
    final _state = _formKey.currentState;
    if (_state == null) return;
    FocusManager.instance.primaryFocus?.unfocus();
    if (_state.validate()) {
      widget.callBack(0);
    }
  }
}
