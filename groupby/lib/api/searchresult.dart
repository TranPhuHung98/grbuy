import 'package:http/http.dart' as http;
import 'package:bigdeals2/tabs/tabs.dart';

class FetchSearchResult {
  Future<List<ProductsItem>> fetchSearchResult(String keyword) async {
    Map key = {
      'filter': {'keyword': keyword}
    };
    // String data = JSON.encode(key);
    String data = jsonEncode(key);
    var response = await http.post(
        "https://groupbuy.vn/api/v1/products-all",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: data);
    if (response.statusCode == 200) {
      if (json.decode(response.body)['message'] == "success") {
        final parsedProducts =
            json.decode(response.body)['data'].cast<Map<String, dynamic>>();
        return parsedProducts
            .map<ProductsItem>((value) => ProductsItem.internalFromJson(value))
            .toList();
      }
    }
    return Future.error("error");
  }
}
