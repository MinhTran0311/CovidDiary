import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/custom_colors.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/commons/validators/validators.dart';

class TextFormFieldWidget extends FormField<String> {
  TextFormFieldWidget({
    required BuildContext context,
    this.label,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.obscureText = false,
    this.readOnly = false,
    this.errorText,
    this.maxLength,
    this.widget,
    this.inputFormatters,
    this.controller,
    this.borderRadius,
    this.maxLines,
    this.minLines,
    this.initialValue,
    this.onChanged,
    this.textStyle,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.autoFocus = false,
    this.isShowClear = true,
    this.onIconTap,
    this.suffix,
    this.prefix,
    this.hasLabel = true,
    String? Function(String?)? validator,
    this.onTap,
  })  : assert(readOnly == true || (readOnly == false && onTap == null)),
        assert(hasLabel == true && label != null),
        super(
            validator: validator,
            initialValue: initialValue ?? controller?.text,
            builder: (FormFieldState<String> state) {
              if (controller != null) {
                controller.addListener(() {
                  if (controller.text != state.value) {
                    state.didChange(controller.text);
                  }
                });
              }

              final clearIcon =
                  (!readOnly && state.value != null && state.value!.isNotEmpty)
                      ? GestureDetector(
                          onTap: () {
                            state.reset();
                            if (controller != null) controller.text = '';
                            if (onChanged != null) onChanged('');
                          },
                          child: SvgPicture.asset('assets/svg/icon/close.svg'),
                        )
                      : null;
              final suffixIcon = clearIcon != null || suffix != null
                  ? Container(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (suffix != null) ...[suffix, SizedBox(width: 8.w)],
                          if (clearIcon != null && isShowClear!) clearIcon,
                        ],
                      ))
                  : null;
              BorderRadius _borderRadius =
                  borderRadius ?? BorderRadius.all(Radius.circular(8.r));
              OutlineInputBorder _outLineBorderRadius = OutlineInputBorder(
                  borderRadius: _borderRadius, borderSide: BorderSide.none);
              OutlineInputBorder _errorBorderRadius = OutlineInputBorder(
                  borderRadius: _borderRadius,
                  borderSide: BorderSide(color: CustomColors.error));
              bool hasError =
                  (errorText != null && errorText.isNotEmpty) || state.hasError;
              final child = TextFormField(
                autofocus: autoFocus!,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                readOnly: readOnly,
                maxLength: maxLength,
                maxLines: maxLines ?? 1,
                minLines: minLines,
                onChanged: (value) {
                  state.didChange(value);
                  if (onChanged != null) onChanged(value);
                },
                controller: controller,
                style: textStyle ??
                    Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: getCustomColor().black),
                keyboardType: keyboardType,
                obscureText: obscureText,
                inputFormatters: inputFormatters,
                decoration: InputDecoration(
                    fillColor: getCustomColor().background,
                    filled: true,
                    isDense: true,
                    prefixIcon: prefix,
                    suffixIcon: suffixIcon,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r))),
                    focusedBorder:
                        hasError ? _errorBorderRadius : _outLineBorderRadius,
                    enabledBorder:
                        hasError ? _errorBorderRadius : _outLineBorderRadius,
                    contentPadding: EdgeInsets.only(
                        left: 16.w, right: 16.w, bottom: 16.h, top: 16.h),
                    hintText: hintText),
              );
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  hasLabel!
                      ? _buildLabel(context, label!, labelStyle)
                      : Container(),
                  Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 8.r,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                      child: child),
                  SizedBox(height: 4.h),
                  if (hasError)
                    _getErrorText(
                        context, errorText ?? state.errorText as String)
                ],
              );
            });

  final String? label;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;
  final String? initialValue;
  final String? hintText;
  final String? errorText;
  final Widget? widget;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final BorderRadius? borderRadius;
  final bool? autoFocus;
  final bool? isShowClear;
  final Widget? suffix;
  final Widget? prefix;
  final VoidCallback? onTap;
  final VoidCallback? onIconTap;
  final bool? hasLabel;

  static TextFormFieldWidget phoneNumber(
      BuildContext context, TextEditingController controller,
      {bool readOnly = false}) {
    return TextFormFieldWidget(
      context: context,
      label: S.current.phone_number_input,
      hintText: S.current.phone_number_hint,
      controller: controller,
      keyboardType: TextInputType.phone,
      readOnly: readOnly,
      inputFormatters: [MaskTextInputFormatter(mask: '### ### ####')],
      validator: Validators.compose([
        Validators.required(errorMessage: S.current.error_empty_phone_number),
        Validators.phoneNumber()
      ]),
      prefix: Padding(
        padding: EdgeInsets.only(left: 16.w, bottom: 2.h),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('(+84) ',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w400, color: getCustomColor().black),
              textAlign: TextAlign.center),
        ]),
      ),
    );
  }

  static Widget password(BuildContext context, TextEditingController controller,
      {String? label, String? hint, bool readOnly = false}) {
    final ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureText,
      builder: (_, value, __) => TextFormFieldWidget(
        context: context,
        label: label ?? S.current.password_input,
        hintText: hint ?? S.current.password_hint,
        controller: controller,
        readOnly: readOnly,
        suffix: GestureDetector(
            onTap: () => _obscureText.value = !_obscureText.value,
            child: !value
                ? SvgPicture.asset('assets/svg/icon/eye_slash.svg')
                : SvgPicture.asset('assets/svg/icon/eye.svg')),
        obscureText: _obscureText.value,
        validator: Validators.compose([
          Validators.required(errorMessage: S.current.error_empty_password),
          Validators.min(8, S.current.error_short_password),
        ]),
      ),
    );
  }

  static Widget confirmPassword(
    BuildContext context,
    TextEditingController controller, {
    String? label,
    String? hint,
    bool readOnly = false,
    TextEditingController? passwordController,
  }) {
    final ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureText,
      builder: (_, value, __) => TextFormFieldWidget(
        context: context,
        label: label ?? S.current.confirm_password_input,
        hintText: hint ?? S.current.confirm_password_hint,
        controller: controller,
        readOnly: readOnly,
        suffix: GestureDetector(
            onTap: () => _obscureText.value = !_obscureText.value,
            child: !value
                ? SvgPicture.asset('assets/svg/icon/eye_slash.svg')
                : SvgPicture.asset('assets/svg/icon/eye.svg')),
        obscureText: _obscureText.value,
        validator: Validators.compose([
          Validators.required(
              errorMessage: S.current.error_empty_confirm_password),
          Validators.min(8, S.current.error_short_password),
          Validators.compareWith(
              passwordController!.text, S.current.error_wrong_confirm_password),
        ]),
      ),
    );
  }
}

///Label text
Widget _buildLabel(BuildContext context, String label, TextStyle? labelStyle) {
  return Padding(
    padding: EdgeInsets.only(bottom: 4.h),
    child: Text(label.toString(),
        style: labelStyle ??
            Theme.of(context).textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.w900, color: getCustomColor().primary)),
  );
}

_getErrorText(BuildContext context, String errorText) {
  return Text(
    errorText,
    textAlign: TextAlign.left,
    style: Theme.of(context)
        .textTheme
        .caption!
        .copyWith(color: CustomColors.error),
  );
}
