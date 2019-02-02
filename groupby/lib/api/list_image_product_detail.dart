import 'package:bigdeals2/tabs/tabs.dart';
import 'package:http/http.dart' as http;

class FetchListImageProductDetail{
  Future<List<String>> fechListImageProDetail(int id) async {
    var response = await http.get(
        "https://groupbuy.vn/api/v1/products/${id}");
    if (response.statusCode == 200) {
      if (json.decode(response.body)['message'] == "success") {
        // print(json.decode(response.body)['data']['image_list']);
        final parsedString =
            json.decode(response.body)['data']['image_list'];
            // .cast<Map<String, dynamic>>();
            // print('adsafdgfjlkjhgfdsiuytrewqjhgfjhgfdrtyuijhgfdsastyuiuytreer$parsedString');
        return parsedString
            .map<String>((value) => value as String)
            .toList();
      }
    }
    return Future.error("error");
  }
}