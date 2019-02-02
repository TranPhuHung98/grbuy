import 'package:http/http.dart' as http;
import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';
class CheckProduct {
  Future<String> postCheckProduct(
      String idProduct, String idDeal, String quantity,String access) async {
    var response = await http
        .post("https://groupbuy.vn/api/v1/check-product", headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer ${access}"
    }, body: {
      'product_id': idProduct,
      'deal_id': idDeal,
      'quantity': quantity
    });
    return  json.decode(response.body)["message"];
  }
}