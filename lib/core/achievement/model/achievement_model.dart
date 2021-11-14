class PersonalData {
  String name;
  String avatarUrl;
  List<awardDetail> awardArr;

  int getTotalPoints() {
    int totalPoint = 0;
    for (var award in awardArr) {
      if (award.isDone == true) totalPoint += award.point;
    }
    return totalPoint;
  }

  void setTotalPoint(number) {
    this.totalPoint = number;
  }

  int totalPoint;
  PersonalData(this.name, this.avatarUrl, this.awardArr, this.totalPoint);
}

class awardDetail {
  String name;
  String imageUrl;
  int point;
  bool isDone;
  awardDetail(this.name, this.imageUrl, this.point, this.isDone);
}