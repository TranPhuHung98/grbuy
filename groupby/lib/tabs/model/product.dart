import 'package:bigdeals2/tabs/model/image_product_detail.dart';
import 'package:meta/meta.dart';
class ProductsItem {
  int id;
  String name;
  int current_deal_id ;
  String description;
  String avatar_image;
  int time_end;
  int price_deal;
  int price;
  int amount_target;
  int amount_sale;
  int quantity ;
  String brand;
  // List<ImageProductDetail> image_list;
    // List<String> image_list;
  
  ProductsItem(
      {this.id,
      this.name,
      this.avatar_image,
      this.price,
      this.time_end,
      this.price_deal,
      this.amount_target,
      this.amount_sale,
      this.description,
      this.current_deal_id,
      this.brand
      // this.image_list
      });
  factory ProductsItem.internalFromJson(Map jsonMap) {
    return ProductsItem(
      id: jsonMap["id"] as int,
      name: jsonMap["name"] as String,
      avatar_image: jsonMap["avatar_image"] as String,
      time_end: jsonMap["time_end"] as int,
      price: jsonMap["price"] as int,
      price_deal: jsonMap["price_deal"] as int,
      amount_target: jsonMap["amount_target"] as int,
      amount_sale: jsonMap["amount_sale"] as  int,
      description: jsonMap["description"] as String,
      current_deal_id: jsonMap["current_deal_id"] as int ,
      brand: jsonMap["brand"] as String,
      // image_list :(jsonMap["image_list"] as List<String>)
      // image_list: ((jsonMap["image_list"]) as List<dynamic>)
      // .map<String>((value) => value. toString())
      //      .toList(),
      //     .cast<Map<String, dynamic>>()
      //     .map<ImageProductDetail>((value) => ImageProductDetail.internalFromJson(value))
      //     .toList(),
           
    );
  }
}
