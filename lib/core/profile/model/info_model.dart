class Info {
  Info._privateConstructor();

  static final Info instance = Info._privateConstructor();

  String name = "Siêu nhân cuồng phong";
  String dob = "30/07/2000";
  String email = "sieunhan@gmail.com";
  String phone = "0935723862";
  String work = "SE-UIT";
  String avatar = "assets/svg/avatar.png";
  bool isPicked = false;
  List<Social> socialArr = [
    Social("Facebook", 'assets/image/facebook.png', "Hoàng tử sa mạt"),
    Social("Tinder", 'assets/image/tinder.png', "Hoàng Tuấn Minh"),
    Social("Twitter", 'assets/image/twitter.png', "t.me/desert.eagle"),
  ];
  // Info(this.name, this.dob, this.email, this.phone, this.work);
}

class Social {
  String name;
  String imgUrl;
  String value;
  Social(this.name, this.imgUrl, this.value);
}
