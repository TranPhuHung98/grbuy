class Slide{
  String source ;
  String url ;
  Slide({this.source,this.url}) ;
  factory Slide.internalFromJson(Map jsonMap){
    return Slide(
      source: jsonMap["source"] as String,
      url: jsonMap["url"] as String,
    );
  }
}