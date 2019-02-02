import 'package:bigdeals2/tabs/tabs.dart';
import 'package:http/http.dart' as http;

class FetchHomePage{
  Future<List<CategaryItem>> fechHomePage(int currentPage, int pageSize) async {
    var response = await http.get(
        "https://groupbuy.vn/api/v1/products-home?page=${currentPage}&page_size=${pageSize}");
    if (response.statusCode == 200) {
      if (json.decode(response.body)['message'] == "success") {
        final parsedCategary =
            json.decode(response.body)['data'].cast<Map<String, dynamic>>();
        return parsedCategary
            .map<CategaryItem>((value) => CategaryItem.internalFromJson(value))
            .toList();
      }
    }
    return Future.error("error");
  }
}