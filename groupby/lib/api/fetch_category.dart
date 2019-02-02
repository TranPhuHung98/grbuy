import 'package:http/http.dart' as http;
import 'package:bigdeals2/tabs/tabs.dart';

class FetchCategory{
  Future<List<ProductsItem>> fetchProductsOfCategories(int id) async {
    var response =
        await http.get("https://groupbuy.vn/api/v1/category/${id}");
    if (response.statusCode == 200) {
      if (json.decode(response.body)['message'] == "success") {
        final parsedProducts =
            json.decode(response.body)['data'].cast<Map<String, dynamic>>();
        print(response.body);
        return parsedProducts
            .map<ProductsItem>((value) => ProductsItem.internalFromJson(value))
            .toList();
      }
    }
    return Future.error("error");
  }
}