import 'package:bigdeals2/tabs/tabs.dart';
class CategaryItem {
  int id;
  String name;
//  String image;
  String ads_url;
  String ads_banner;
  List<ProductsItem> products;
  CategaryItem(
      {this.id, this.name,this.ads_url, this.ads_banner, this.products});
  factory CategaryItem.internalFromJson(Map jsonMap) {
    return CategaryItem(
      id: jsonMap["id"] as int,
      name: jsonMap["name"] as String,
      ads_url: jsonMap["ads_url"] as String,
      ads_banner: jsonMap["ads_banner"] as String,
      products: ((jsonMap["products"]) as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map<ProductsItem>((value) => ProductsItem.internalFromJson(value))
          .toList(),
    );
  }
}
