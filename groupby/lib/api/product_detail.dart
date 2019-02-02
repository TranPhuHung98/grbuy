import 'package:bigdeals2/tabs/tabs.dart';
import 'package:http/http.dart' as http;

class FetchProductDetail{
  Future<ProductsItem>fetchProductDetail(int id) async {
    var response = await http.get(
        "https://groupbuy.vn/api/v1/products/${id}");
    if (response.statusCode == 200) {
      if (json.decode(response.body)['message'] == "success") {
        return ProductsItem.internalFromJson(json.decode(response.body)['data']);
      }
    }
    return Future.error("error");
  }
}