import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/commons/themes/custom_colors.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/widgets/button/fill_button.dart';
import 'package:src/widgets/indicator/circular_count_down_timer.dart';
import 'package:src/widgets/input_field/text_form_field.dart';
import 'package:src/widgets/input_field/otp_input_field.dart';

enum Stage { first, second, third }

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword>
    with TickerProviderStateMixin {
  late TextEditingController _phoneController;
  late TextEditingController _otpTextController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late final GlobalKey<OTPInputState> _otpKey;
  late AnimationController _countdownController;

  late Stage stage;
  final GlobalKey<FormState> _resetPassFormKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _phoneController = new TextEditingController();
    _otpTextController = new TextEditingController();
    _passwordController = new TextEditingController();
    _confirmPasswordController = new TextEditingController();
    _otpKey = GlobalKey<OTPInputState>();
    _countdownController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    stage = Stage.first;
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _otpTextController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _countdownController.dispose();
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
            stage == Stage.first ? _buildPhoneForm() : SizedBox.shrink(),
            stage == Stage.second ? _buildOTP() : SizedBox.shrink(),
            stage == Stage.third ? _buildResetPass() : SizedBox.shrink(),
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
      child: Stack(children: [
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
      ]),
    );
  }

  Widget _buildPhoneForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: _formKey,
        child: Column(children: [
          TextFormFieldWidget.phoneNumber(context, _phoneController)
        ]),
      ),
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

  Widget _buildResetPass() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: _resetPassFormKey,
        child: Column(children: [
          TextFormFieldWidget.password(context, _passwordController),
          SizedBox(height: 24.h),
          TextFormFieldWidget.confirmPassword(
              context, _confirmPasswordController,
              label: S.current.confirm_password_input,
              hint: S.current.confirm_password_hint,
              passwordController: _passwordController),
        ]),
      ),
    );
  }

  Widget _buildBottomField() {
    return FillButton(
      width: 198.w,
      buttonText: S.current.confirm,
      onPressed: () {
        if (stage == Stage.first) {
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
        } else if (stage == Stage.second) {
          if (_otpKey.currentState!.checkValidLength()) {
            if (_otpTextController.text == "123456") {
              _otpKey.currentState!.setOTPState(true);
              this.setState(() {
                stage = Stage.third;
              });
            } else {
              _otpKey.currentState!.setOTPState(false);
            }
          }
        } else {
          final _state = _resetPassFormKey.currentState;
          if (_state == null) return;
          FocusManager.instance.primaryFocus?.unfocus();
          if (_state.validate()) {
            this.setState(() {
              goBack(context);
            });
          }
        }
      },
    );
  }
}
