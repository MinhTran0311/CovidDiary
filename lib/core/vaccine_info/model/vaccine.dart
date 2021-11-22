class Vaccine {
  String name;
  List<Country> country;
  int effect;
  int numberOfCountries;
  int doses;
  int price;
  String detail;

  Vaccine(
      {required this.name,
      required this.country,
      required this.effect,
      required this.numberOfCountries,
      required this.doses,
      required this.price,
      required this.detail});
}

class Country {
  String? name;
  String? imgUrl;

  Country({this.name, this.imgUrl});
}

Country US = new Country(name: "US", imgUrl: "assets/image/flags/US.png");
Country UK = new Country(name: "UK", imgUrl: "assets/image/flags/UK.png");
Country Sweden =
    new Country(name: "Sweden", imgUrl: "assets/image/flags/sweden.png");
Country China =
    new Country(name: "China", imgUrl: "assets/image/flags/china.png");
Country Germany =
    new Country(name: "Germany", imgUrl: "assets/image/flags/germany.png");
Country Belgium =
    new Country(name: "BelGium", imgUrl: "assets/image/flags/belgium.png");
Country Russia =
    new Country(name: "Russia", imgUrl: "assets/image/flags/russia.png");

List<Vaccine> vaccines = [
  Vaccine(
      name: "Astra Zeneca",
      country: [UK, Sweden],
      effect: 70,
      numberOfCountries: 174,
      doses: 2,
      price: 4,
      detail:
          "Vắc xin Oxford – AstraZeneca COVID-19, có tên mã là AZD1222, [5] và được bán dưới tên thương hiệu Covishield [21] và Vaxzevria [1] [22] cùng những loại khác, là một loại vắc xin vectơ vi rút để phòng ngừa COVID-19. Được phát triển tại Vương quốc Anh bởi Đại học Oxford và công ty AstraZeneca của Anh-Thụy Điển, [23] [24] [25] sử dụng làm véc tơ cho loài tinh tinh adenovirus đã sửa đổi ChAdOx1. [26] Thuốc chủng này được tiêm bắp. Các nghiên cứu được thực hiện vào năm 2020 cho thấy hiệu quả của vắc-xin là 76,0% trong việc ngăn ngừa COVID-19 có triệu chứng bắt đầu từ 22 ngày sau liều đầu tiên và 81,3% sau liều thứ hai. [27] Một nghiên cứu ở Scotland cho thấy, đối với nhiễm COVID-19 có triệu chứng sau liều thứ hai, vắc-xin có hiệu quả 81% đối với biến thể Alpha (dòng B.1.1.7) và 61% đối với biến thể Delta (dòng B.1.617. 2). [28] Vắc xin ổn định ở nhiệt độ tủ lạnh và có tính an toàn tốt, với các tác dụng phụ bao gồm đau tại chỗ tiêm, nhức đầu và buồn nôn, tất cả thường hết trong vòng vài ngày. [29] [30] Hiếm hơn, phản vệ có thể xảy ra; Cơ quan Quản lý Thuốc và Sản phẩm Chăm sóc Sức khỏe Vương quốc Anh (MHRA) có 268 báo cáo trong số khoảng 21,2 triệu lượt tiêm chủng tính đến ngày 14 tháng 4 năm 2021. [30] Trong một số trường hợp rất hiếm (khoảng 1 trong 100.000 người), vắc-xin có liên quan đến việc tăng nguy cơ đông máu khi kết hợp với lượng tiểu cầu trong máu thấp. [31] [32] [1] Theo Cơ quan Thuốc Châu Âu tính đến ngày 4 tháng 4 năm 2021, tổng số 222 trường hợp đông máu cực hiếm trong số 447 triệu người (tỷ lệ 0,000049664%) được báo cáo từ Khu vực Kinh tế Châu Âu, tỷ lệ này bao gồm Vương quốc Anh, (nơi a hơn nữa 34 triệu người cũng đã được chủng ngừa). [33]"),
  Vaccine(
      name: "Pfizer & BioNtech",
      country: [US, Germany],
      effect: 95,
      numberOfCountries: 102,
      doses: 2,
      price: 20,
      detail:
          "Vắc-xin COVID-19 của Pfizer–BioNTech (pINN: tozinameran), được bán với nhãn hiệu Comirnaty,[15] là một loại vắc-xin COVID-19 dựa trên mRNA. Vắc-xin ban đầu được phát triển bởi công ty Đức BioNTech, sau đó công ty này hợp tác với hãng dược phẩm Trung Quốc Fosun[16] cùng với công ty Pfizer của Mỹ hỗ trợ thử nghiệm lâm sàng, vận chuyển và sản xuất.[17][18]Vắc-xin được tiêm bằng cách tiêm bắp. Trong vắc-xin chứa mRNA biến đổi nucleoside (modRNA) mã hóa một thể đột biến của protein gai virus SARS-CoV-2, bên ngoài là lớp hạt nano lipid.[19] Mỗi người cần tiêm đủ hai mũi, mỗi mũi cách nhau ba tuần.[20][21][22] Cùng với vắc-xin COVID-19 của Moderna, đây là một trong hai loại vắc-xin RNA phòng COVID-19 được triển khai trong năm 2020. Các cuộc thử nghiệm lâm sàng đã được bắt đầu từ tháng 4 năm 2020; tới tháng 11, vắc-xin đã bước vào giai đoạn thử nghiệm lâm sàng thứ ba, với hơn 40.000 tình nguyện viên tham gia.[23] Một bản phân tích sơ bộ cho thấy hiệu quả ngăn ngừa nhiễm bệnh có thể lên tới trên 90% trong vòng bảy ngày sau khi tiêm mũi thứ hai.[21][22] Các tác dụng phụ phổ biến nhất bao gồm đau nhẹ và vừa tại vùng tiêm, mệt mỏi và đau đầu.[24][25] Các báo cáo về tác dụng phụ nghiêm trọng, như các phản ứng mẫn cảm, rất hiếm khi xảy ra,[a] và hiện chưa phát hiện các biến chứng lâu dài nào.[27][28] Việc giám sát các kết quả chính từ các cuộc thử nghiệm sẽ tiếp tục tới tháng 8 năm 2021, các kết quả phụ khác sẽ kết thúc giám sát vào tháng 1 năm 2023.[20]"),
  Vaccine(
      name: "Sinovac",
      country: [China],
      effect: 50,
      numberOfCountries: 34,
      doses: 2,
      price: 30,
      detail:
          "CoronaVac, còn được gọi là vắc-xin COVID-19 Sinovac,[1] là vắc-xin COVID-19 dùng virus bất hoạt được công ty Sinovac Biotech của Trung Quốc phát triển.[2] Nó được thử nghiệm lâm sàng giai đoạn III ở Brazil,[3] Chile,[4] Indonesia,[5] Philippines,[6] và Thổ Nhĩ Kỳ[7]. Vắc xin này dựa trên công nghệ truyền thống tương tự như BBIBP-CorV và Covaxin, hai loại vắc-xin phòng ngừa covid-19 dùng virus bất hoạt khác.[8] CoronaVac không cần phải đông lạnh và cả sản phẩm cuối cùng và nguyên liệu thô để tạo ra CoronaVac đều có thể được vận chuyển trong tủ lạnh ở 2–8 °C (36–46 °F), tương đương nhiệt độ dùng để lưu trữ vắc xin cúm.[9] Một nghiên cứu thực tế trên 10 triệu người Chile đã sử dụng CoronaVac cho thấy nó có hiệu quả 66% đối với COVID-19 có triệu chứng, 88% đối với việc nhập viện, 90% đối với việc nhập phòng ICU và 86% đối với tử vong.[10] Tại Brazil, sau khi 75% dân số ở Serrana, São Paulo, được tiêm CoronaVac, kết quả sơ bộ cho thấy số ca tử vong giảm 95%, số ca nhập viện giảm 86% và số ca có triệu chứng giảm 80%.[11][12] Tại Indonesia, dữ liệu thực tế từ 128.290 nhân viên y tế cho thấy khả năng của CoronaVac bảo vệ khỏi nhiễm bệnh có triệu chứng là 94%, cao hơn cả các kết quả trong các thử nghiệm lâm sàng.[13] Kết quả giai đoạn III từ Thổ Nhĩ Kỳ được công bố trên The Lancet cho thấy hiệu quả của CoronaVac đạt hiệu quả 84% dựa trên 10,218 người tham gia thử nghiệm.[14][15] Kết quả giai đoạn III từ Brazil trước đây cho thấy vắc xin này có 50,7% hiệu quả trong việc ngăn ngừa nhiễm trùng có triệu chứng và 83,7% hiệu quả trong việc ngăn ngừa các trường hợp nhẹ cần điều trị. Hiệu quả chống lại các ca nhiễm bệnh có triệu chứng tăng lên 62,3% với khoảng cách thời gian giữa các liều là 21 ngày hoặc hơn.[16]"),
  Vaccine(
      name: "Moderna",
      country: [US],
      effect: 94,
      numberOfCountries: 52,
      doses: 2,
      price: 37,
      detail:
          "Vắc-xin COVID‑19 Moderna (pINN: elasomeran[1]), có tên mã là mRNA-1273 và được đưa ra thị trường với tên thương hiệu Spikevax, là vắc xin COVID-19 được Moderna , Viện Dị ứng và Bệnh truyền nhiễm Quốc gia Hoa Kỳ (NIAID) và Cơ quan Phát triển và Nghiên cứu Tiên tiến Y sinh Hoa Kỳ (BARDA) phát triển. Vắc xin này được phép sử dụng cho những người từ 12 tuổi trở lên ở một số khu vực pháp lý và cho những người từ 18 tuổi trở lên ở các khu vực pháp lý khác để phòng chống bệnh COVID-19 gây ra do sự lây nhiễm của vi rút SARS-CoV-2.[2][3] Thiết kế sử dụng của vắc xin này là hai liều 0,5 mL, đưa vào cơ thể bằng cách tiêm bắp thịt, thời gian cách nhau 29 ngày.[4] Đây là một loại vắc-xin RNA bao gồm RNA thông tin biến đổi nucleoside (modRNA) mã hóa một protein gai của SARS-CoV-2, được bao trong các hạt nano lipid.[5] Vắc xin COVID‑19 Moderna được phép sử dụng ở một số cấp độ ở 53 quốc gia, bao gồm Canada, các quốc gia thuộc Khu vực Kinh tế Châu Âu, Singapore, Philippines, Hàn Quốc, Thái Lan, Vương quốc Anh và Hoa Kỳ.[6]"),
  Vaccine(
      name: "Spunik V",
      country: [Russia],
      effect: 92,
      numberOfCountries: 47,
      doses: 2,
      price: 10,
      detail:
          "Sputnik V (tiếng Nga: Спутник V) là loại vắc-xin COVID-19 được phát triển bởi Viện Nghiên cứu Dịch tễ học và Vi sinh vật học Gamaleya. Sputnik V sử dụng vector là một loài virus adeno ở người và đã được Bộ Y tế Nga đăng ký với tên gọi Gam-COVID-Vac (tiếng Nga: Гам-КОВИД-Вак, chuyển tự Gam-KOVID-Vak) vào ngày 11 tháng 8 năm 2020.[2][3] Gam-COVID-Vac được cấp phép phân phối tại Nga dựa trên kết quả thử nghiệm sơ bộ Giai đoạn I-II được xuất bản vào ngày 4 tháng 9 năm 2020.[4] Việc cấp phép vắc-xin Gam-COVID-Vac quá nhanh vào đầu tháng 8 đã nhận nhiều chỉ trích từ truyền thông và gây ra tranh cãi trong cộng đồng khoa học khi nhiều người cho rằng độ an toàn và hiệu quả của vắc-xin chưa được kiểm chứng rõ ràng.[2][3][5][6][7] Vào ngày 2 tháng 2 năm 2021, các phân tích được xuất bản trên tạp chí The Lancet cho thấy vắc-xin có hiệu quả 91,6% và không gây ra tác dụng phụ nào bất thường.[8] Tiến trình phân phối khẩn cấp trên diện rộng vắc-xin Sputnik V bắt đầu vào tháng 12 năm 2020 tại nhiều quốc gia, trong đó có Nga, Argentina, Belarus, Hungary, Serbia và Các Tiểu vương quốc Ả Rập Thống nhất. Tính đến tháng 3 năm 2021, 45 quốc gia đã cấp phép sử dụng khẩn cấp vắc-xin Sputnik V,[9] đồng thời hơn một tỷ liều vắc-xin đã được đặt mua để phân phối trên toàn cầu.[10]. Việt Nam cũng mới sản xuất thành công lô vắc-xin Sputnik V đầu tiên từ bán thành phẩm, công nghệ do Nga chuyển giao[11]"),
];
