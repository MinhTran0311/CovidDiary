import 'package:flutter/material.dart';
import 'package:src/commons/notifications/notifications.dart';
import 'package:src/widgets/button/fill_button.dart';
import 'package:src/widgets/button/non_fill_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/widgets/input_field/text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Center(
                child: FillButton(
                  isAccent: true,
                  buttonText: "Hellp",
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 16.h),
              NonFillButton(
                onPressed: () {},
                buttonText: "123",
              ),
              SizedBox(height: 16.h),
              NonFillButton(
                onPressed: () {
                  snackBar(context, "Pop up success");
                },
                buttonText: "123",
                isHasBorder: false,
              ),
              TextFormFieldWidget(context: context,label: "Input",)
            ],
          ),
        ),
      ),
    );
  }
}
