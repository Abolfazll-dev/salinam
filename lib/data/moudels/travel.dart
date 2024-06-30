class Travel {
  String id;
  String name;
  String image;
  String link;

  Travel(
    this.id,
    this.name,
    this.image,
    this.link,
  );

  factory Travel.fromMapJson(Map<String, dynamic> jsonObject) {
    return Travel(
      jsonObject['id'],
      jsonObject['name'],
      'https://salinam.chbk.run/api/files/travel/${jsonObject['id']}/${jsonObject['image']}',
      jsonObject['link'],
    );
  }
}
