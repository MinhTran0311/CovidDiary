// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Việt Nam`
  String get language {
    return Intl.message(
      'Việt Nam',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Hủy bỏ`
  String get confirm_cancel {
    return Intl.message(
      'Hủy bỏ',
      name: 'confirm_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Đồng ý`
  String get confirm_ok {
    return Intl.message(
      'Đồng ý',
      name: 'confirm_ok',
      desc: '',
      args: [],
    );
  }

  /// `Kiểm tra`
  String get test {
    return Intl.message(
      'Kiểm tra',
      name: 'test',
      desc: '',
      args: [],
    );
  }

  /// `Xin chào`
  String get hello {
    return Intl.message(
      'Xin chào',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng điền thông tin.`
  String get text_field_error_empty_input {
    return Intl.message(
      'Vui lòng điền thông tin.',
      name: 'text_field_error_empty_input',
      desc: '',
      args: [],
    );
  }

  /// `Email không hợp lệ. Vui lòng thử lại.`
  String get text_field_error_invalid_email {
    return Intl.message(
      'Email không hợp lệ. Vui lòng thử lại.',
      name: 'text_field_error_invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Số diện thoại không hợp lệ. Vui lòng thử lại`
  String get text_field_error_invalid_phone_number {
    return Intl.message(
      'Số diện thoại không hợp lệ. Vui lòng thử lại',
      name: 'text_field_error_invalid_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Nhập số điện thoại của bạn`
  String get phone_number_input {
    return Intl.message(
      'Nhập số điện thoại của bạn',
      name: 'phone_number_input',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mật khẩu`
  String get password_input {
    return Intl.message(
      'Nhập mật khẩu',
      name: 'password_input',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận mật khẩu`
  String get confirm_password_input {
    return Intl.message(
      'Xác nhận mật khẩu',
      name: 'confirm_password_input',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email_input {
    return Intl.message(
      'E-mail',
      name: 'email_input',
      desc: '',
      args: [],
    );
  }

  /// `Sự cố gặp phải`
  String get issue_input {
    return Intl.message(
      'Sự cố gặp phải',
      name: 'issue_input',
      desc: '',
      args: [],
    );
  }

  /// `Nhập lại mật khẩu của bạn`
  String get confirm_password_hint {
    return Intl.message(
      'Nhập lại mật khẩu của bạn',
      name: 'confirm_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Nhập số điện thoại của bạn`
  String get phone_number_hint {
    return Intl.message(
      'Nhập số điện thoại của bạn',
      name: 'phone_number_hint',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mật khẩu của bạn`
  String get password_hint {
    return Intl.message(
      'Nhập mật khẩu của bạn',
      name: 'password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Nhập sự cố gặp phải`
  String get issue_hint {
    return Intl.message(
      'Nhập sự cố gặp phải',
      name: 'issue_hint',
      desc: '',
      args: [],
    );
  }

  /// `Nhập email của bạn`
  String get email_hint {
    return Intl.message(
      'Nhập email của bạn',
      name: 'email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Quên mật khẩu?`
  String get forgot_password {
    return Intl.message(
      'Quên mật khẩu?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập tài khoản`
  String get sign_in_button {
    return Intl.message(
      'Đăng nhập tài khoản',
      name: 'sign_in_button',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập`
  String get sign_in {
    return Intl.message(
      'Đăng nhập',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký tài khoản`
  String get sign_up_button {
    return Intl.message(
      'Đăng ký tài khoản',
      name: 'sign_up_button',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký`
  String get sign_up {
    return Intl.message(
      'Đăng ký',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập bằng số điện thoại`
  String get login_with_phone {
    return Intl.message(
      'Đăng nhập bằng số điện thoại',
      name: 'login_with_phone',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập bằng Apple`
  String get login_with_appleID {
    return Intl.message(
      'Đăng nhập bằng Apple',
      name: 'login_with_appleID',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập bằng Google`
  String get login_with_google {
    return Intl.message(
      'Đăng nhập bằng Google',
      name: 'login_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận`
  String get confirm {
    return Intl.message(
      'Xác nhận',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Hình ảnh`
  String get images {
    return Intl.message(
      'Hình ảnh',
      name: 'images',
      desc: '',
      args: [],
    );
  }

  /// `Gửi`
  String get send {
    return Intl.message(
      'Gửi',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Thư viện ảnh`
  String get gallery {
    return Intl.message(
      'Thư viện ảnh',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Mã OTP nhập sai. Vui lòng nhập lại.`
  String get wrong_otp_code {
    return Intl.message(
      'Mã OTP nhập sai. Vui lòng nhập lại.',
      name: 'wrong_otp_code',
      desc: '',
      args: [],
    );
  }

  /// `Gửi lại mã OTP`
  String get resend_otp_code {
    return Intl.message(
      'Gửi lại mã OTP',
      name: 'resend_otp_code',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mã OTP`
  String get otp_input {
    return Intl.message(
      'Nhập mã OTP',
      name: 'otp_input',
      desc: '',
      args: [],
    );
  }

  /// `Chưa có tài khoản?`
  String get dont_have_account {
    return Intl.message(
      'Chưa có tài khoản?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Đã có tài khoản?`
  String get have_an_account {
    return Intl.message(
      'Đã có tài khoản?',
      name: 'have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại sai. Vui lòng thử lại.`
  String get error_wrong_phone_number {
    return Intl.message(
      'Số điện thoại sai. Vui lòng thử lại.',
      name: 'error_wrong_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu xác nhận không đúng. Vui lòng thử lại.`
  String get error_wrong_confirm_password {
    return Intl.message(
      'Mật khẩu xác nhận không đúng. Vui lòng thử lại.',
      name: 'error_wrong_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu nhập sai. Vui lòng thử lại`
  String get error_wrong_password {
    return Intl.message(
      'Mật khẩu nhập sai. Vui lòng thử lại',
      name: 'error_wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập số điện thoại.`
  String get error_empty_phone_number {
    return Intl.message(
      'Vui lòng nhập số điện thoại.',
      name: 'error_empty_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập mật khẩu.`
  String get error_empty_password {
    return Intl.message(
      'Vui lòng nhập mật khẩu.',
      name: 'error_empty_password',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu có độ dài ít nhất 8 kí tự.`
  String get error_short_password {
    return Intl.message(
      'Mật khẩu có độ dài ít nhất 8 kí tự.',
      name: 'error_short_password',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng xác nhận lại mật khẩu.`
  String get error_empty_confirm_password {
    return Intl.message(
      'Vui lòng xác nhận lại mật khẩu.',
      name: 'error_empty_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập E-mail`
  String get error_empty_email {
    return Intl.message(
      'Vui lòng nhập E-mail',
      name: 'error_empty_email',
      desc: '',
      args: [],
    );
  }

  /// `E-mail nhập sai. Vui lòng thử lại`
  String get error_wrong_email {
    return Intl.message(
      'E-mail nhập sai. Vui lòng thử lại',
      name: 'error_wrong_email',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập nội dung sự cố`
  String get error_empty_issue {
    return Intl.message(
      'Vui lòng nhập nội dung sự cố',
      name: 'error_empty_issue',
      desc: '',
      args: [],
    );
  }

  /// `Đã có lỗi xảy ra. Vui lòng thử lại`
  String get error_occur_please_try_again {
    return Intl.message(
      'Đã có lỗi xảy ra. Vui lòng thử lại',
      name: 'error_occur_please_try_again',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng điền thông tin`
  String get error_empty_input {
    return Intl.message(
      'Vui lòng điền thông tin',
      name: 'error_empty_input',
      desc: '',
      args: [],
    );
  }

  /// `Đã gửi lại OTP`
  String get otp_resent {
    return Intl.message(
      'Đã gửi lại OTP',
      name: 'otp_resent',
      desc: '',
      args: [],
    );
  }

  /// `Hãy luôn đeo khẩu trang ngay khi ra khỏi nhà, đến những nơi công cộng, tập trung đông người.`
  String get on_boarding1 {
    return Intl.message(
      'Hãy luôn đeo khẩu trang ngay khi ra khỏi nhà, đến những nơi công cộng, tập trung đông người.',
      name: 'on_boarding1',
      desc: '',
      args: [],
    );
  }

  /// `Chỉ ra khỏi nhà khi thật sự cần thiết, luôn ghi chú hành trình di chuyển của bản thân.`
  String get on_boarding2 {
    return Intl.message(
      'Chỉ ra khỏi nhà khi thật sự cần thiết, luôn ghi chú hành trình di chuyển của bản thân.',
      name: 'on_boarding2',
      desc: '',
      args: [],
    );
  }

  /// `Rửa tay là phương pháp hữu hiệu để ngăn ngừa không chỉ Covid-19 mà còn với các bệnh lý hô hấp khác `
  String get on_boarding3 {
    return Intl.message(
      'Rửa tay là phương pháp hữu hiệu để ngăn ngừa không chỉ Covid-19 mà còn với các bệnh lý hô hấp khác ',
      name: 'on_boarding3',
      desc: '',
      args: [],
    );
  }

  /// `Theo dõi sức khỏe mỗi ngày, liên hệ ngay cơ quan y tế khi có dấu hiệu bất thường.`
  String get on_boarding4 {
    return Intl.message(
      'Theo dõi sức khỏe mỗi ngày, liên hệ ngay cơ quan y tế khi có dấu hiệu bất thường.',
      name: 'on_boarding4',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin dịch bệnh`
  String get disease_info_app_bar_title {
    return Intl.message(
      'Thông tin dịch bệnh',
      name: 'disease_info_app_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `Nhiễm`
  String get disease_info_cases {
    return Intl.message(
      'Nhiễm',
      name: 'disease_info_cases',
      desc: '',
      args: [],
    );
  }

  /// `Khỏi`
  String get disease_info_healed {
    return Intl.message(
      'Khỏi',
      name: 'disease_info_healed',
      desc: '',
      args: [],
    );
  }

  /// `Tử vong`
  String get disease_info_death {
    return Intl.message(
      'Tử vong',
      name: 'disease_info_death',
      desc: '',
      args: [],
    );
  }

  /// `Việt Nam`
  String get disease_info_vietnam {
    return Intl.message(
      'Việt Nam',
      name: 'disease_info_vietnam',
      desc: '',
      args: [],
    );
  }

  /// `Thế giới`
  String get disease_info_world {
    return Intl.message(
      'Thế giới',
      name: 'disease_info_world',
      desc: '',
      args: [],
    );
  }

  /// `Tỉnh/Thành phố`
  String get disease_info_table_province {
    return Intl.message(
      'Tỉnh/Thành phố',
      name: 'disease_info_table_province',
      desc: '',
      args: [],
    );
  }

  /// `Quốc gia`
  String get disease_info_table_nation {
    return Intl.message(
      'Quốc gia',
      name: 'disease_info_table_nation',
      desc: '',
      args: [],
    );
  }

  /// `Nhiễm bệnh`
  String get disease_info_table_cases {
    return Intl.message(
      'Nhiễm bệnh',
      name: 'disease_info_table_cases',
      desc: '',
      args: [],
    );
  }

  /// `Bình phục`
  String get disease_info_table_healed {
    return Intl.message(
      'Bình phục',
      name: 'disease_info_table_healed',
      desc: '',
      args: [],
    );
  }

  /// `Tử vong`
  String get disease_info_table_deaths {
    return Intl.message(
      'Tử vong',
      name: 'disease_info_table_deaths',
      desc: '',
      args: [],
    );
  }

  /// `Ho`
  String get symptom_name_1 {
    return Intl.message(
      'Ho',
      name: 'symptom_name_1',
      desc: '',
      args: [],
    );
  }

  /// `Sốt`
  String get symptom_name_2 {
    return Intl.message(
      'Sốt',
      name: 'symptom_name_2',
      desc: '',
      args: [],
    );
  }

  /// `Khó thở`
  String get symptom_name_3 {
    return Intl.message(
      'Khó thở',
      name: 'symptom_name_3',
      desc: '',
      args: [],
    );
  }

  /// `Nôn /\nbuồn nôn`
  String get symptom_name_4 {
    return Intl.message(
      'Nôn /\nbuồn nôn',
      name: 'symptom_name_4',
      desc: '',
      args: [],
    );
  }

  /// `Đau đầu`
  String get symptom_name_5 {
    return Intl.message(
      'Đau đầu',
      name: 'symptom_name_5',
      desc: '',
      args: [],
    );
  }

  /// `Đau họng`
  String get symptom_name_6 {
    return Intl.message(
      'Đau họng',
      name: 'symptom_name_6',
      desc: '',
      args: [],
    );
  }

  /// `Nổi ban\nngoài da`
  String get symptom_name_7 {
    return Intl.message(
      'Nổi ban\nngoài da',
      name: 'symptom_name_7',
      desc: '',
      args: [],
    );
  }

  /// `Tiêu chảy`
  String get symptom_name_8 {
    return Intl.message(
      'Tiêu chảy',
      name: 'symptom_name_8',
      desc: '',
      args: [],
    );
  }

  /// ` nhẹ`
  String get symptom_severity_1 {
    return Intl.message(
      ' nhẹ',
      name: 'symptom_severity_1',
      desc: '',
      args: [],
    );
  }

  /// ` vừa`
  String get symptom_severity_2 {
    return Intl.message(
      ' vừa',
      name: 'symptom_severity_2',
      desc: '',
      args: [],
    );
  }

  /// ` nặng`
  String get symptom_severity_3 {
    return Intl.message(
      ' nặng',
      name: 'symptom_severity_3',
      desc: '',
      args: [],
    );
  }

  /// `Thi thoảng, bạn bị ho một cái.\nCó thể nó không đủ để coi như là bị bệnh, nhưng nó có làm phiền bạn một chút ít.`
  String get symptom_info_1_1 {
    return Intl.message(
      'Thi thoảng, bạn bị ho một cái.\nCó thể nó không đủ để coi như là bị bệnh, nhưng nó có làm phiền bạn một chút ít.',
      name: 'symptom_info_1_1',
      desc: '',
      args: [],
    );
  }

  /// `Bạn cảm giác như bạn bị cảm.\nBạn ho đủ nhiều để khiến bạn khó chịu, và khả năng cao nếu bạn không mắc Covid thì bạn cũng bị cảm hay gì đó.`
  String get symptom_info_1_2 {
    return Intl.message(
      'Bạn cảm giác như bạn bị cảm.\nBạn ho đủ nhiều để khiến bạn khó chịu, và khả năng cao nếu bạn không mắc Covid thì bạn cũng bị cảm hay gì đó.',
      name: 'symptom_info_1_2',
      desc: '',
      args: [],
    );
  }

  /// `Bạn ho thường xuyên.\nThường xuyên đến nỗi bạn bắt đầu thấy mệt.\nCó lẽ đến mức này, bạn rất nên đi khám bệnh.`
  String get symptom_info_1_3 {
    return Intl.message(
      'Bạn ho thường xuyên.\nThường xuyên đến nỗi bạn bắt đầu thấy mệt.\nCó lẽ đến mức này, bạn rất nên đi khám bệnh.',
      name: 'symptom_info_1_3',
      desc: '',
      args: [],
    );
  }

  /// `Bạn bị sốt 37-38 độ C.\nSốt có thể khiến bạn mệt một chút, nhưng không gì quá nặng.`
  String get symptom_info_2_1 {
    return Intl.message(
      'Bạn bị sốt 37-38 độ C.\nSốt có thể khiến bạn mệt một chút, nhưng không gì quá nặng.',
      name: 'symptom_info_2_1',
      desc: '',
      args: [],
    );
  }

  /// `Bạn bị sốt 38-39 độ C.\nĐợt sốt này khiến bạn quá mệt để làm việc gì nặng, và bạn nên nghỉ bệnh hôm nay.`
  String get symptom_info_2_2 {
    return Intl.message(
      'Bạn bị sốt 38-39 độ C.\nĐợt sốt này khiến bạn quá mệt để làm việc gì nặng, và bạn nên nghỉ bệnh hôm nay.',
      name: 'symptom_info_2_2',
      desc: '',
      args: [],
    );
  }

  /// `Bạn bị sốt 39+ độ C.\nBạn bị sốt nặng, và nên uống thuốc hạ sốt để giữ thân nhiệt thấp.`
  String get symptom_info_2_3 {
    return Intl.message(
      'Bạn bị sốt 39+ độ C.\nBạn bị sốt nặng, và nên uống thuốc hạ sốt để giữ thân nhiệt thấp.',
      name: 'symptom_info_2_3',
      desc: '',
      args: [],
    );
  }

  /// `Bạn bị tức ngực, nghẹt mũi, hay khó thở nói chung.\nBạn phải thở mạnh hơn bình thường, và nó có thể khó chịu một chút, nhưng chưa ảnh hưởng lớn đến khả năng hô hấp.`
  String get symptom_info_3_1 {
    return Intl.message(
      'Bạn bị tức ngực, nghẹt mũi, hay khó thở nói chung.\nBạn phải thở mạnh hơn bình thường, và nó có thể khó chịu một chút, nhưng chưa ảnh hưởng lớn đến khả năng hô hấp.',
      name: 'symptom_info_3_1',
      desc: '',
      args: [],
    );
  }

  /// `Bạn bị khó thở.\nThi thoảng bạn phải thở dốc vì thiếu oxy.`
  String get symptom_info_3_2 {
    return Intl.message(
      'Bạn bị khó thở.\nThi thoảng bạn phải thở dốc vì thiếu oxy.',
      name: 'symptom_info_3_2',
      desc: '',
      args: [],
    );
  }

  /// `Bạn bị khó thở nặng.\nBạn đã ngất ít nhất 1 lần trong ngày vì thiếu oxy.\nNếu bạn chưa đến bệnh viện thì bạn nên đến đó đi.`
  String get symptom_info_3_3 {
    return Intl.message(
      'Bạn bị khó thở nặng.\nBạn đã ngất ít nhất 1 lần trong ngày vì thiếu oxy.\nNếu bạn chưa đến bệnh viện thì bạn nên đến đó đi.',
      name: 'symptom_info_3_3',
      desc: '',
      args: [],
    );
  }

  /// `Nhiều lúc trong ngày, bạn thấy muốn ói.`
  String get symptom_info_4_1 {
    return Intl.message(
      'Nhiều lúc trong ngày, bạn thấy muốn ói.',
      name: 'symptom_info_4_1',
      desc: '',
      args: [],
    );
  }

  /// `Bạn đã ói 1 lần trong ngày.`
  String get symptom_info_4_2 {
    return Intl.message(
      'Bạn đã ói 1 lần trong ngày.',
      name: 'symptom_info_4_2',
      desc: '',
      args: [],
    );
  }

  /// `Bạn đã ói nhiều lần trong ngày.\nBạn nên ăn uống đầy đủ để đảm bảo dinh dưỡng.\nCó khi bạn nên đi khám`
  String get symptom_info_4_3 {
    return Intl.message(
      'Bạn đã ói nhiều lần trong ngày.\nBạn nên ăn uống đầy đủ để đảm bảo dinh dưỡng.\nCó khi bạn nên đi khám',
      name: 'symptom_info_4_3',
      desc: '',
      args: [],
    );
  }

  /// `Bạn cảm thấy nhức đầu.\nChuyện bình thường nếu hôm nay bạn làm việc quá sức.`
  String get symptom_info_5_1 {
    return Intl.message(
      'Bạn cảm thấy nhức đầu.\nChuyện bình thường nếu hôm nay bạn làm việc quá sức.',
      name: 'symptom_info_5_1',
      desc: '',
      args: [],
    );
  }

  /// `Bạn cảm thấy chóng mặt.\nCó thể bạn sẽ ngã xuống bất cứ lúc nào.`
  String get symptom_info_5_2 {
    return Intl.message(
      'Bạn cảm thấy chóng mặt.\nCó thể bạn sẽ ngã xuống bất cứ lúc nào.',
      name: 'symptom_info_5_2',
      desc: '',
      args: [],
    );
  }

  /// `Bạn cảm thấy đau đầu.\nCó thể nó đau nhói, có thể nó đau giai giẳng, nhưng nó dường như sẽ không bớt đi sớm nếu bạn không đi khám.`
  String get symptom_info_5_3 {
    return Intl.message(
      'Bạn cảm thấy đau đầu.\nCó thể nó đau nhói, có thể nó đau giai giẳng, nhưng nó dường như sẽ không bớt đi sớm nếu bạn không đi khám.',
      name: 'symptom_info_5_3',
      desc: '',
      args: [],
    );
  }

  /// `Bạn cảm thấy khô họng.\nNhớ uống đủ nước nha bạn.`
  String get symptom_info_6_1 {
    return Intl.message(
      'Bạn cảm thấy khô họng.\nNhớ uống đủ nước nha bạn.',
      name: 'symptom_info_6_1',
      desc: '',
      args: [],
    );
  }

  /// `Bạn cảm thấy ngứa họng.\nBạn có thể muốn ho. Khi đó, nhớ che miệng hoặc ho vào khuỷu tay, và rửa tay thường xuyên.`
  String get symptom_info_6_2 {
    return Intl.message(
      'Bạn cảm thấy ngứa họng.\nBạn có thể muốn ho. Khi đó, nhớ che miệng hoặc ho vào khuỷu tay, và rửa tay thường xuyên.',
      name: 'symptom_info_6_2',
      desc: '',
      args: [],
    );
  }

  /// `Bạn cảm thấy đau họng.\nBạn có thể bị khàn tiếng.\nCó lẽ bạn nên đi khám.`
  String get symptom_info_6_3 {
    return Intl.message(
      'Bạn cảm thấy đau họng.\nBạn có thể bị khàn tiếng.\nCó lẽ bạn nên đi khám.',
      name: 'symptom_info_6_3',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get symptom_info_7_1 {
    return Intl.message(
      '',
      name: 'symptom_info_7_1',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get symptom_info_7_2 {
    return Intl.message(
      '',
      name: 'symptom_info_7_2',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get symptom_info_7_3 {
    return Intl.message(
      '',
      name: 'symptom_info_7_3',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get symptom_info_8_1 {
    return Intl.message(
      '',
      name: 'symptom_info_8_1',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get symptom_info_8_2 {
    return Intl.message(
      '',
      name: 'symptom_info_8_2',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get symptom_info_8_3 {
    return Intl.message(
      '',
      name: 'symptom_info_8_3',
      desc: '',
      args: [],
    );
  }

  /// `Mình rất vui\nkhi bạn tâm tư với mình!`
  String get health_report_response_positive {
    return Intl.message(
      'Mình rất vui\nkhi bạn tâm tư với mình!',
      name: 'health_report_response_positive',
      desc: '',
      args: [],
    );
  }

  /// `Cố lên bạn ơi,\ndịch bệnh sẽ qua mau thôi!`
  String get health_report_response_negative {
    return Intl.message(
      'Cố lên bạn ơi,\ndịch bệnh sẽ qua mau thôi!',
      name: 'health_report_response_negative',
      desc: '',
      args: [],
    );
  }

  /// `Hôm nay bạn thấy thế nào?`
  String get health_report_emotion_greeting {
    return Intl.message(
      'Hôm nay bạn thấy thế nào?',
      name: 'health_report_emotion_greeting',
      desc: '',
      args: [],
    );
  }

  /// `Vui vẻ`
  String get health_report_emotion_1 {
    return Intl.message(
      'Vui vẻ',
      name: 'health_report_emotion_1',
      desc: '',
      args: [],
    );
  }

  /// `Hài lòng`
  String get health_report_emotion_2 {
    return Intl.message(
      'Hài lòng',
      name: 'health_report_emotion_2',
      desc: '',
      args: [],
    );
  }

  /// `Thoải mái`
  String get health_report_emotion_3 {
    return Intl.message(
      'Thoải mái',
      name: 'health_report_emotion_3',
      desc: '',
      args: [],
    );
  }

  /// `Phấn khởi`
  String get health_report_emotion_4 {
    return Intl.message(
      'Phấn khởi',
      name: 'health_report_emotion_4',
      desc: '',
      args: [],
    );
  }

  /// `Mệt mỏi`
  String get health_report_emotion_5 {
    return Intl.message(
      'Mệt mỏi',
      name: 'health_report_emotion_5',
      desc: '',
      args: [],
    );
  }

  /// `Buồn`
  String get health_report_emotion_6 {
    return Intl.message(
      'Buồn',
      name: 'health_report_emotion_6',
      desc: '',
      args: [],
    );
  }

  /// `Chán nản`
  String get health_report_emotion_7 {
    return Intl.message(
      'Chán nản',
      name: 'health_report_emotion_7',
      desc: '',
      args: [],
    );
  }

  /// `Bực bội`
  String get health_report_emotion_8 {
    return Intl.message(
      'Bực bội',
      name: 'health_report_emotion_8',
      desc: '',
      args: [],
    );
  }

  /// `Dạo này bạn có bị gì không?`
  String get symptom_report_greeting {
    return Intl.message(
      'Dạo này bạn có bị gì không?',
      name: 'symptom_report_greeting',
      desc: '',
      args: [],
    );
  }

  /// `Chúc bạn một ngày vui vẻ`
  String get symptom_report_response_positive {
    return Intl.message(
      'Chúc bạn một ngày vui vẻ',
      name: 'symptom_report_response_positive',
      desc: '',
      args: [],
    );
  }

  /// `Nếu bạn không thấy khoẻ,\ncó lẽ bạn nên ở nhà hôm nay.`
  String get symptom_report_response_negative {
    return Intl.message(
      'Nếu bạn không thấy khoẻ,\ncó lẽ bạn nên ở nhà hôm nay.',
      name: 'symptom_report_response_negative',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
