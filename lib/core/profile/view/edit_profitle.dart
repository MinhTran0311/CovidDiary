import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/commons/validators/validators.dart';
import 'package:src/core/profile/model/info_model.dart';
import 'package:src/widgets/input_field/gradient_background.dart';
import 'package:src/widgets/input_field/text_form_field.dart';
import 'package:src/widgets/panel.dart';
import 'package:src/widgets/round_avatar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  late TextEditingController _userNameController;
  late TextEditingController _dobController;
  late TextEditingController _phoneController;
  late TextEditingController _workController;
  late TextEditingController _emailController;
  final ImagePicker _picker = ImagePicker();
  // Pick an image
  XFile? image = null;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController(text: Info.instance.name);
    _dobController = TextEditingController(text: Info.instance.dob);
    _phoneController = TextEditingController(text: Info.instance.phone);
    _workController = TextEditingController(text: Info.instance.work);
    _emailController = TextEditingController(text: Info.instance.email);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    _workController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackGround(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: _buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => {goBack(context)},
              icon: SvgPicture.asset('assets/svg/icon/cancle.svg'),
              color: getCustomColor().white,
            ),
            IconButton(
              onPressed: () {
                _submit();
              },
              icon: SvgPicture.asset('assets/svg/icon/confirm.svg'),
              color: getCustomColor().white,
            ),
          ],
        ),
        SizedBox(height: 70.h),
        _buildInputField(context),
        SizedBox(height: 10.h),
        _buildSocialField(context),
        SizedBox(height: 10.h),
      ]),
    );
  }

  void _submit() {
    final _state = _formKey.currentState;
    if (_state == null) return;
    FocusManager.instance.primaryFocus?.unfocus();
    if (_state.validate()) {
      Info.instance.name = _userNameController.text;
      goBack(context);
    }
  }

  Widget _buildInputField(BuildContext context) {
    return Container(
        child: Stack(children: [
      PanelLight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 64.h),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormFieldWidget(
                    context: context,
                    label: S.current.update_profile_name_displayed,
                    hintText: S.current.phone_number_hint,
                    controller: _userNameController,
                    validator: Validators.required(
                        errorMessage: S.current.error_empty_input),
                  ),
                  SizedBox(height: 10.h),
                  TextFormFieldWidget(
                    context: context,
                    label: S.current.profile_info_dob,
                    hintText: S.current.dob_hint,
                    controller: _dobController,
                    validator: Validators.required(
                        errorMessage: S.current.error_empty_input),
                  ),
                  SizedBox(height: 10.h),
                  TextFormFieldWidget(
                    context: context,
                    label: "Email",
                    hintText: S.current.email_hint,
                    controller: _emailController,
                    validator: Validators.required(
                        errorMessage: S.current.error_empty_input),
                  ),
                  SizedBox(height: 10.h),
                  TextFormFieldWidget.phoneNumber(context, _phoneController),
                  SizedBox(height: 10.h),
                  TextFormFieldWidget(
                    context: context,
                    label: S.current.profile_info_work,
                    hintText: S.current.work_hint,
                    controller: _workController,
                    validator: Validators.required(
                        errorMessage: S.current.error_empty_input),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            //Info Detail
            //  _buildInfoDetail(S.current.profile_info_dob, "15/03/2020"),
            SizedBox(height: 8.h),
            // _buildInfoDetail(
            //     S.current.email_input, "Sieu nhan cuong @ gmail.com"),
            // SizedBox(height: 8.h),
            // _buildInfoDetail(S.current.profile_info_phone, "0935723862"),
            // SizedBox(height: 8.h),
            // _buildInfoDetail(S.current.profile_info_work, "Product Owner"),
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          _showImageSourceActionSheet(context);
        },
        child: Center(
          child: Container(
            transform: Matrix4.translationValues(0.0, -64.h, 0.0),
            child: RoundAvatar(
              path: Info.instance.avatar,
              isPicked: Info.instance.isPicked,
              width: 128.w,
              height: 128.h,
            ),
          ),
        ),
      ),
    ]));
  }

  Widget _buildSocialField(BuildContext context) {
    return PanelLight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              // This next line does the trick.
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/image/facebook.png'),
                ),
                Image(
                  image: AssetImage('assets/image/tinder.png'),
                ),
                Image(
                  image: AssetImage('assets/image/telegram.png'),
                ),
                Image(
                  image: AssetImage('assets/image/linkedin.png'),
                ),
                Image(
                  image: AssetImage('assets/image/twitter.png'),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 32.w,
          ),
          Expanded(
            flex: 6,
            child: Column(
              // This next line does the trick.
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    "aaa",
                  ),
                ),
                Image(
                  image: AssetImage('assets/image/tinder.png'),
                ),
                Image(
                  image: AssetImage('assets/image/telegram.png'),
                ),
                Image(
                  image: AssetImage('assets/image/linkedin.png'),
                ),
                Image(
                  image: AssetImage('assets/image/twitter.png'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showImageSourceActionSheet(BuildContext context) {
    if (Platform.isIOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(actions: [
          CupertinoActionSheetAction(
            child: Text(S.current.camera),
            onPressed: () async {
              Navigator.pop(context);
              image = await _picker.pickImage(source: ImageSource.camera);
              if (image != null) {
                Info.instance.avatar = image!.path;
                Info.instance.isPicked = true;
              }
              setState(() {});
            },
          ),
          CupertinoActionSheetAction(
            child: Text(S.current.gallery),
            onPressed: () async {
              goBack(context);
              image = await _picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                Info.instance.avatar = image!.path;
                Info.instance.isPicked = true;
              }
              setState(() {});
            },
          )
        ]),
      );
    } else {
      showModalBottomSheet(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) => Container(
          color: getCustomColor().background,
          child: Wrap(children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text(S.current.camera),
              onTap: () async {
                goBack(context);
                image = await _picker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  Info.instance.avatar = image!.path;
                  Info.instance.isPicked = true;
                }
                setState(() {});
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text(S.current.gallery),
              onTap: () async {
                goBack(context);
                image = await _picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  Info.instance.avatar = image!.path;
                  Info.instance.isPicked = true;
                }
                setState(() {});
              },
            )
          ]),
        ),
      );
    }
  }
}
