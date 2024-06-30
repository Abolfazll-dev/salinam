class News {
  String id;
  String title;
  String image;
  String news;

  News(
    this.id,
    this.title,
    this.image,
    this.news,
  );

  factory News.fromMapJson(Map<String, dynamic> jsonObject) {
    return News(
      jsonObject['id'],
      jsonObject['title'],
      'https://salinam.chbk.run/api/files/News/${jsonObject['id']}/${jsonObject['image']}',
      jsonObject['News'],
    );
  }
}
