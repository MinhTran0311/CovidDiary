// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:src/commons/themes/custom_colors.dart';
//
// class OTPInput extends StatefulWidget {
//   final String label;
//   final EdgeInsets? otpPadding;
//   final double? otpFieldWidth;
//   final double? containerWidth;
//   final double? containerHeight;
//   final double? containerBorderRadius;
//   final int otpLength;
//   final double? otpSingleHeight;
//   final double? otpSingleWidth;
//   final FormFieldValidator<String>? validator;
//   final Color backgroundColor;
//   final Color dashColor;
//   final Color fontColor;
//   final Color labelColor;
//   final double? labelFontSize;
//   final bool showCursor;
//   final TextEditingController textController;
//   final ValueChanged<String>? onCompleted;
//   final ValueChanged<String>? onChanged;
//   final bool Function(String? text)? beforeTextPaste;
//   final Color normalStateColor;
//   final Color successStateColor;
//   final Color errorStateColor;
//   final Widget successIcon;
//   final Widget errorIcon;
//   final String errorText;
//   final TextStyle? optTextStyle;
//
//   const OTPInput(
//       {Key? key,
//       required this.label,
//       this.otpPadding,
//       this.otpFieldWidth,
//       this.validator,
//       this.backgroundColor = const Color(0xFFEDF5FD),
//       this.dashColor = const Color(0xFF0B3259),
//       this.fontColor = const Color(0xFF0B3259),
//       this.labelColor = const Color(0xFF6FB1EE),
//       this.labelFontSize,
//       this.containerWidth,
//       this.containerHeight,
//       this.containerBorderRadius,
//       this.otpLength = 6,
//       this.showCursor = false,
//       required this.textController,
//       this.onCompleted,
//       this.onChanged,
//       this.beforeTextPaste,
//       this.otpSingleHeight,
//       this.otpSingleWidth,
//       this.normalStateColor = const Color(0xFF1A7DD8),
//       this.successStateColor = CustomColors.success,
//       this.errorStateColor = CustomColors.error,
//       required this.successIcon,
//       required this.errorIcon,
//       required this.errorText,
//       this.optTextStyle})
//       : super(key: key);
//
//   @override
//   OTPInputState createState() => OTPInputState();
// }
//
// enum OTPState { normalState, successState, errorState }
//
// class OTPInputState extends State<OTPInput> {
//   late FocusNode optFocusNode;
//   late final formKey;
//
//   late OTPState state;
//
//   void setOTPState(bool success) {
//     setState(() {
//       state = success ? OTPState.successState : OTPState.errorState;
//     });
//   }
//
//   bool checkValidLength() {
//     if (widget.textController.text.length < widget.otpLength) {
//       setState(() {
//         state = OTPState.errorState;
//       });
//       return false;
//     }
//     return true;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     formKey = GlobalKey<FormState>();
//     optFocusNode = new FocusNode();
//     state = OTPState.normalState;
//   }
//
//   @override
//   void dispose() {
//     //widget.textController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => optFocusNode.requestFocus(),
//       child: Container(
//         width: widget.containerWidth ?? 312.w,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             _buildLabel(),
//             SizedBox(height: 4.h),
//             Stack(children: [
//               Container(
//                 width: widget.containerWidth ?? 312.w,
//                 height: widget.containerHeight ?? 48.h,
//                 decoration: BoxDecoration(
//                   color: widget.backgroundColor,
//                   border: Border.all(
//                       color: state == OTPState.normalState
//                           ? widget.normalStateColor
//                           : (state == OTPState.errorState
//                               ? widget.errorStateColor
//                               : widget.successStateColor)),
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(widget.containerBorderRadius ?? 16),
//                   ),
//                 ),
//               ),
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                 Container(
//                   padding: widget.otpPadding ??
//                       EdgeInsets.only(
//                         left: 16.w,
//                         right: 16.w,
//                         top: 8.h,
//                       ),
//                   decoration: BoxDecoration(color: Colors.transparent),
//                   width: widget.otpFieldWidth ?? 164.w,
//                   child: _buildPinInput(context),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     if (state == OTPState.errorState) {
//                       widget.textController.clear();
//                       state = OTPState.normalState;
//                       setState(() {});
//                     }
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.only(bottom: 8.h, right: 8.w),
//                     child: state == OTPState.normalState
//                         ? Container(
//                             width: 0,
//                             height: 0,
//                           )
//                         : (state == OTPState.errorState
//                             ? widget.errorIcon
//                             : widget.successIcon),
//                   ),
//                 )
//               ])
//             ]),
//             state == OTPState.errorState
//                 ? Text(
//                     widget.errorText,
//                     style: Theme.of(context).textTheme.caption!.copyWith(
//                         color: CustomColors.error, fontWeight: FontWeight.w400),
//                   )
//                 : Container(width: 0, height: 0)
//           ],
//         ),
//       ),
//     );
//   }
//
//   Text _buildLabel() {
//     return Text(widget.label.toString(),
//         style: Theme.of(context).textTheme.bodyText1!.copyWith(
//             fontSize: 12.sp,
//             fontWeight: FontWeight.w400,
//             color: getCustomColor().slivingBlue400));
//   }
//
//   Widget _buildPinInput(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: PinCodeTextField(
//         autoDisposeControllers: false,
//         focusNode: optFocusNode,
//         appContext: context,
//         textStyle: widget.optTextStyle,
//         pastedTextStyle: TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//         ),
//         length: widget.otpLength,
//         validator: widget.validator,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         pinTheme: PinTheme(
//             shape: PinCodeFieldShape.underline,
//             borderWidth: 2.w,
//             activeColor: widget.backgroundColor,
//             disabledColor: widget.backgroundColor,
//             errorBorderColor: widget.backgroundColor,
//             inactiveColor: widget.dashColor,
//             selectedColor: widget.dashColor,
//             fieldHeight: widget.otpSingleHeight ?? 32.h,
//             fieldWidth: widget.otpSingleWidth ?? 16.w,
//             activeFillColor: widget.backgroundColor,
//             inactiveFillColor: widget.backgroundColor,
//             selectedFillColor: widget.backgroundColor),
//         showCursor: widget.showCursor,
//         cursorColor: widget.dashColor,
//         animationDuration: Duration(milliseconds: 0),
//         enableActiveFill: true,
//         errorAnimationController: null,
//         controller: widget.textController,
//         keyboardType: TextInputType.number,
//         onCompleted: widget.onCompleted,
//         onChanged: (value) => {
//           if (value.length < widget.otpLength &&
//               this.state != OTPState.normalState)
//             {
//               this.setState(() {
//                 this.state = OTPState.normalState;
//               }),
//             },
//           if (widget.onChanged != null) {widget.onChanged}
//         },
//         //paste OTP from message
//         beforeTextPaste: widget.beforeTextPaste,
//       ),
//     );
//   }
// }
