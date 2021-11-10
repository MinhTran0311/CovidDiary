import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/widgets/button/fill_button.dart';
import 'package:src/widgets/input_field/text_form_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TextEditingController _phoneController;

  //late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _phoneController = new TextEditingController();
    //_passwordController = new TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    //_passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 378.h,
          child: Column(children: [
            _buildTopBar(),
            SizedBox(height: 24.h),
            _buildForm(),
            Expanded(child: SizedBox.shrink()),
            _buildBottomField(),
            SizedBox(height: 16.h)
          ]),
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: getCustomColor().background,
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: getCustomColor().primary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              S.current.forgot_password,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: getCustomColor().white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: () => goBack(context),
              child: Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset("assets/svg/icon/close-r.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          TextFormFieldWidget.phoneNumber(context, _phoneController),
        ],
      ),
    );
  }

  Widget _buildBottomField() {
    return FillButton(
      width: 198.w,
      buttonText: S.current.sign_in,
      onPressed: () {
        // _submit();
      },
    );
  }
}
