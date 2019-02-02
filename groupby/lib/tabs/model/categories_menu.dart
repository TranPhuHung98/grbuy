class ListCategories {
  int id;
  String name;
  String image;
  String ads_url;
  String ads_banner;
  ListCategories(
      {this.id, this.name, this.image, this.ads_url, this.ads_banner});
  factory ListCategories.internalFromJson(Map jsonMap) {
    return ListCategories(
      id: jsonMap["id"] as int,
      name: jsonMap["name"] as String,
      image: jsonMap["image"] as String,
      ads_url: jsonMap["ads_url"] as String,
      ads_banner: jsonMap["ads_banner"] as String,
    );
  }
}