import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/custom_colors.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/widgets/button/fill_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/widgets/indicator/circular_count_down_timer.dart';
import 'package:src/widgets/input_field/text_form_field.dart';
import 'package:src/widgets/input_field/otp_input_field.dart';

enum Stage { first, second }

class SignUpPage extends StatefulWidget {
  final Function callBack;

  const SignUpPage({Key? key, required this.callBack}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();

  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _otpTextController;
  late AnimationController _countdownController;
  late final GlobalKey<OTPInputState> _otpKey;
  late Stage stage;

  @override
  void initState() {
    super.initState();
    _phoneController = new TextEditingController();
    _passwordController = new TextEditingController();
    _confirmPasswordController = new TextEditingController();
    _otpTextController = new TextEditingController();
    _otpKey = GlobalKey<OTPInputState>();
    _countdownController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    stage = Stage.first;
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _otpTextController.dispose();
    _confirmPasswordController.dispose();
    _countdownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
          child: Column(children: [
            stage == Stage.first ? _buildFormField() : SizedBox.shrink(),
            stage == Stage.second ? _buildOTP() : SizedBox.shrink(),
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
        SizedBox(height: 24.h),
        TextFormFieldWidget.confirmPassword(context, _confirmPasswordController,
            label: S.current.confirm_password_input,
            hint: S.current.confirm_password_hint,
            passwordController: _passwordController),
      ]),
    );
  }

  Widget _buildOTP() {
    return Column(
      children: [
        OTPInput(
            key: _otpKey,
            label: S.current.otp_input,
            textController: _otpTextController,
            backgroundColor: getCustomColor().white,
            dashColor: getCustomColor().black,
            fontColor: getCustomColor().black,
            labelColor: getCustomColor().primary,
            normalStateColor: Colors.transparent,
            errorIcon: SvgPicture.asset("assets/svg/icon/close.svg",
                color: CustomColors.error),
            successIcon: SvgPicture.asset("assets/svg/icon/tick_circle.svg"),
            errorText: S.current.wrong_otp_code),
        SizedBox(height: 36.h),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          GestureDetector(
            onTap: () async {
              if (_countdownController.isAnimating) {
                return;
              } else {
                _countdownController.reverse(
                    from: _countdownController.value == 0.0
                        ? 1.0
                        : _countdownController.value);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: getCustomColor().primary, width: 1.5.w))),
              child: Text(S.current.resend_otp_code,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: getCustomColor().primary,
                      fontWeight: FontWeight.w700)),
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            height: 16.h,
            width: 16.h,
            child: Align(
              alignment: FractionalOffset.center,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: AnimatedBuilder(
                  animation: _countdownController,
                  builder: (BuildContext context, Widget? child) {
                    return CustomPaint(
                      painter: CircularCountdownTimer(
                          animation: _countdownController,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          color: getCustomColor().primary),
                    );
                  },
                ),
              ),
            ),
          )
        ])
      ],
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
            buttonText:
                stage == Stage.first ? S.current.sign_up : S.current.confirm,
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
    if (stage == Stage.first) {
      this.setState(() {});
      final _state = _formKey.currentState;
      if (_state == null) return;
      FocusManager.instance.primaryFocus?.unfocus();
      if (_state.validate()) {
        this.setState(() {
          stage = Stage.second;
          _countdownController.reverse(
              from: _countdownController.value == 0.0
                  ? 1.0
                  : _countdownController.value);
        });
      }
    } else {
      if (_otpKey.currentState!.checkValidLength()) {
        if (_otpTextController.text == "123456") {
          _otpKey.currentState!.setOTPState(true);
          stage = Stage.first;

          widget.callBack(0);
        } else {
          _otpKey.currentState!.setOTPState(false);
        }
      }
    }
  }
}
