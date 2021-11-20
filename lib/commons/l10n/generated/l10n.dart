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

  /// `Xin chào`
  String get dashboard_hello {
    return Intl.message(
      'Xin chào',
      name: 'dashboard_hello',
      desc: '',
      args: [],
    );
  }

  /// `Xem chi tiết`
  String get dashboard_detail {
    return Intl.message(
      'Xem chi tiết',
      name: 'dashboard_detail',
      desc: '',
      args: [],
    );
  }

  /// `Siêu nhân cuồng phong`
  String get dashboard_def_username {
    return Intl.message(
      'Siêu nhân cuồng phong',
      name: 'dashboard_def_username',
      desc: '',
      args: [],
    );
  }

  /// `Tình hình dịch bệnh hôm nay`
  String get dashboard_today_stats {
    return Intl.message(
      'Tình hình dịch bệnh hôm nay',
      name: 'dashboard_today_stats',
      desc: '',
      args: [],
    );
  }

  /// `Thế giới`
  String get dashboard_world {
    return Intl.message(
      'Thế giới',
      name: 'dashboard_world',
      desc: '',
      args: [],
    );
  }

  /// `Việt Nam`
  String get dashboard_vn {
    return Intl.message(
      'Việt Nam',
      name: 'dashboard_vn',
      desc: '',
      args: [],
    );
  }

  /// `Bị nhiễm`
  String get dashboard_infected {
    return Intl.message(
      'Bị nhiễm',
      name: 'dashboard_infected',
      desc: '',
      args: [],
    );
  }

  /// `Khỏi bệnh`
  String get dashboard_recovered {
    return Intl.message(
      'Khỏi bệnh',
      name: 'dashboard_recovered',
      desc: '',
      args: [],
    );
  }

  /// `Theo dõi sức khỏe`
  String get dashboard_heath_track {
    return Intl.message(
      'Theo dõi sức khỏe',
      name: 'dashboard_heath_track',
      desc: '',
      args: [],
    );
  }

  /// `Hôm nay bạn có khỏe không, để mình ghi lại nhé !`
  String get dashboard_heath_track_button {
    return Intl.message(
      'Hôm nay bạn có khỏe không, để mình ghi lại nhé !',
      name: 'dashboard_heath_track_button',
      desc: '',
      args: [],
    );
  }

  /// `T2`
  String get dashboard_monday {
    return Intl.message(
      'T2',
      name: 'dashboard_monday',
      desc: '',
      args: [],
    );
  }

  /// `T3`
  String get dashboard_tuesday {
    return Intl.message(
      'T3',
      name: 'dashboard_tuesday',
      desc: '',
      args: [],
    );
  }

  /// `T4`
  String get dashboard_wednesday {
    return Intl.message(
      'T4',
      name: 'dashboard_wednesday',
      desc: '',
      args: [],
    );
  }

  /// `T5`
  String get dashboard_thursday {
    return Intl.message(
      'T5',
      name: 'dashboard_thursday',
      desc: '',
      args: [],
    );
  }

  /// `T6`
  String get dashboard_friday {
    return Intl.message(
      'T6',
      name: 'dashboard_friday',
      desc: '',
      args: [],
    );
  }

  /// `T7`
  String get dashboard_saturday {
    return Intl.message(
      'T7',
      name: 'dashboard_saturday',
      desc: '',
      args: [],
    );
  }

  /// `CN`
  String get dashboard_sunday {
    return Intl.message(
      'CN',
      name: 'dashboard_sunday',
      desc: '',
      args: [],
    );
  }

  /// `Theo dõi điểm đến`
  String get dashboard_place_track {
    return Intl.message(
      'Theo dõi điểm đến',
      name: 'dashboard_place_track',
      desc: '',
      args: [],
    );
  }

  /// `Những nơi bạn đã đến trong 21 ngày qua`
  String get dashboard_place_you_visited {
    return Intl.message(
      'Những nơi bạn đã đến trong 21 ngày qua',
      name: 'dashboard_place_you_visited',
      desc: '',
      args: [],
    );
  }

  /// `Hôm nay bạn có đi đâu không ? Ghi nhớ lại ngay!`
  String get dashboard_place_track_button {
    return Intl.message(
      'Hôm nay bạn có đi đâu không ? Ghi nhớ lại ngay!',
      name: 'dashboard_place_track_button',
      desc: '',
      args: [],
    );
  }

  /// `Và 12 nơi khác ...`
  String get dashboard_more_place {
    return Intl.message(
      'Và 12 nơi khác ...',
      name: 'dashboard_more_place',
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

  /// `Bảng xếp hạng`
  String get score_board_app_bar_title {
    return Intl.message(
      'Bảng xếp hạng',
      name: 'score_board_app_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `Hôm nay`
  String get score_board_today {
    return Intl.message(
      'Hôm nay',
      name: 'score_board_today',
      desc: '',
      args: [],
    );
  }

  /// `Tuần`
  String get score_board_week {
    return Intl.message(
      'Tuần',
      name: 'score_board_week',
      desc: '',
      args: [],
    );
  }

  /// `Tháng`
  String get score_board_month {
    return Intl.message(
      'Tháng',
      name: 'score_board_month',
      desc: '',
      args: [],
    );
  }

  /// `Ghi chú sức khỏe (nghiêm túc)`
  String get health_declaration_app_bar_title {
    return Intl.message(
      'Ghi chú sức khỏe (nghiêm túc)',
      name: 'health_declaration_app_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `Trong ngày hôm nay, bạn có thấy xuất hiện dấu hiệu nào sau đây không ?`
  String get health_declaration_first_question {
    return Intl.message(
      'Trong ngày hôm nay, bạn có thấy xuất hiện dấu hiệu nào sau đây không ?',
      name: 'health_declaration_first_question',
      desc: '',
      args: [],
    );
  }

  /// `Trong hôm nay, bạn có tiếp xúc với: `
  String get health_declaration_second_question {
    return Intl.message(
      'Trong hôm nay, bạn có tiếp xúc với: ',
      name: 'health_declaration_second_question',
      desc: '',
      args: [],
    );
  }

  /// `Người bệnh, người nghi ngờ mắc Covid-19`
  String get health_declaration_covid_patient {
    return Intl.message(
      'Người bệnh, người nghi ngờ mắc Covid-19',
      name: 'health_declaration_covid_patient',
      desc: '',
      args: [],
    );
  }

  /// `Người từ quốc gia có ca bệnh Covid-19`
  String get health_declaration_nations {
    return Intl.message(
      'Người từ quốc gia có ca bệnh Covid-19',
      name: 'health_declaration_nations',
      desc: '',
      args: [],
    );
  }

  /// `Người có biểu hiện (sốt, ho, khó thở, ...)`
  String get health_declaration_symptom {
    return Intl.message(
      'Người có biểu hiện (sốt, ho, khó thở, ...)',
      name: 'health_declaration_symptom',
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
