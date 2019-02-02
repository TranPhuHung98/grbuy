import 'package:http/http.dart' as http;
import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';
class CreatOrder {
  Future<String> creatOrders(
      Address address, List<ProductsItem> listProduct,String access) async {
    Map data = {
      'address': address.location,
      'receiver': address.receiver,
      'phone_number': address.phone_number,
      'list_product': listProduct.map((p)=>{
            'id': p.id.toString(),
            'quantity': p.quantity.toString(), 
          }).toList()
    };
    // String body = JSON.encode(data);
    String body = jsonEncode(data);
    var response =
        await http.post("https://groupbuy.vn/api/v1/create-order",
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
              "Authorization": "Bearer ${access}"
            },
            body:body);
      return json.decode(response.body)["message"];
  }

}