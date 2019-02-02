import 'package:bigdeals2/tabs/tabs.dart';
import 'package:http/http.dart' as http;

class FetchListCategories{
    Future<List<ListCategories>> fetchListCategories() async {
    var response =
        await http.get("https://groupbuy.vn/api/v1/category");
    if (response.statusCode == 200) {
      if (json.decode(response.body)['message'] == "success") {
        final parsedCategories =
            json.decode(response.body)['data'].cast<Map<String, dynamic>>();
        return parsedCategories
            .map<ListCategories>(
                (value) => ListCategories.internalFromJson(value))
            .toList();
      }
    }
    return Future.error("error");
  }
}