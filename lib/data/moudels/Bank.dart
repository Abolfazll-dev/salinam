class Bank {
  String id;
  String title;
  String image;
  String link;

  Bank(
    this.id,
    this.title,
    this.image,
    this.link,
  );

  factory Bank.fromMapJson(Map<String, dynamic> jsonObject) {
    return Bank(
      jsonObject['id'],
      jsonObject['title'],
      'https://salinam.chbk.run/api/files/Bank/${jsonObject['id']}/${jsonObject['image']}',
      jsonObject['link'],
    );
  }
}