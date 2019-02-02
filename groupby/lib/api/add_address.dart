import 'package:http/http.dart' as http;
import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';
class Add_Address {
  Future<String> addAddress(
      String receiver, String location, String phone_number,String access) async {
    var response = await http
        .post("https://groupbuy.vn/api/v1/user/add_address", headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer ${access}"
    }, body: {
      'receiver': receiver,
      'location': location,
      'phone_number': phone_number
    });
    print(phone_number);
      return json.decode(response.body)["message"];
  }


}