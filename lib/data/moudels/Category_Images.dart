class CategoryIMG {
  String id;
  String thumbnail;

  CategoryIMG(
    this.id,
    this.thumbnail,
  );

  factory CategoryIMG.fromMapJson(Map<String, dynamic> jsonObject) {
    return CategoryIMG(
      jsonObject['id'],
      'https://salinam.chbk.run/api/files/CategoryImages/${jsonObject['id']}/${jsonObject['thumbnail']}',
    );
  }
}
