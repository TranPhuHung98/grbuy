import 'package:http/http.dart' as http;
import 'package:bigdeals2/tabs/tabs.dart';
class ShipFee {
  Future<int> fetchFee() async {
    var response =
        await http.get("https://groupbuy.vn/api/v1/config");
    if (response.statusCode == 200) {
      if (json.decode(response.body)['message'] == "config static") {
        int ship = json.decode(response.body)['data']['fee_ship'] ;
         print(ship);
        return ship ;
      }
    }
    return Future.error("error");
  }
}