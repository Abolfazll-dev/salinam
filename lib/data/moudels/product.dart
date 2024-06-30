class Product {
  String image;
  String id;
  String file2;
  String file;
  String title;
  String popularity;
  int? zamin;
  int? mahvate;
  int? yakhteman;
  int? machinery;
  int? tasisat;
  int? vehicles;
  int? preoperationalCosts;
  int? administrativeCosts;
  int? personnel;

  Product(
    this.image,
    this.id,
    this.file2,
    this.file,
    this.title,
    this.popularity,
    this.zamin,
    this.mahvate,
    this.yakhteman,
    this.machinery,
    this.tasisat,
    this.vehicles,
    this.preoperationalCosts,
    this.administrativeCosts,
    this.personnel,
  );

  factory Product.fromMapJson(Map<String, dynamic> jsonObject) {
    return Product(
      'https://salinam.chbk.run/api/files/Products/${jsonObject['id']}/${jsonObject['Image']}',
      jsonObject['id'],
      jsonObject['file'],
      'https://salinam.chbk.run/api/files/Products/${jsonObject['id']}/${jsonObject['file']}',
      jsonObject['title'],
      jsonObject['popularity'],
      jsonObject['Zamin'],
      jsonObject['Mahvate'],
      jsonObject['Yakhteman'],
      jsonObject['Machinery'],
      jsonObject['Tasisat'],
      jsonObject['vehicles'],
      jsonObject['PreoperationalCosts'],
      jsonObject['AdministrativeCosts'],
      jsonObject['Personnel'],
    );
  }
}
