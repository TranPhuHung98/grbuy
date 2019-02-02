class ImageProductDetail {
  String image ;
  ImageProductDetail({this.image});
  factory ImageProductDetail.internalFromJson(Map jsonMap) {
    return ImageProductDetail(
      image: jsonMap["image"] as String 
     );
  }
}