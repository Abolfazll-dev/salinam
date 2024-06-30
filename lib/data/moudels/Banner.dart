class BannerCampain {
  String id;
  String thumbnail;

  BannerCampain(
    this.id,
    this.thumbnail,
  );

  factory BannerCampain.fromMapJson(Map<String, dynamic> jsonObject) {
    return BannerCampain(
      jsonObject['id'],
      'https://salinam.chbk.run/api/files/SliderBanners/${jsonObject['id']}/${jsonObject['thumbnail']}',
    );
  }
}
