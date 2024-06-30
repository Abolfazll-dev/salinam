class DailyPrice2 {
  String id;
  String title;
  int price;
  String model;
  String karKard;

  DailyPrice2(
    this.id,
    this.title,
    this.price,
    this.model,
    this.karKard,
  );

  factory DailyPrice2.fromMapJson(Map<String, dynamic> jsonObject) {
    return DailyPrice2(
      jsonObject['id'],
      jsonObject['title'],
      jsonObject['Price'],
      jsonObject['model'],
      jsonObject['karKard'],
    );
  }
}
