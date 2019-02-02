import 'package:http/http.dart' as http;
import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';
class GetAddress {
   Future<List<Address>> getAddressUser(String access) async {
    var response = await http.get(
      "https://groupbuy.vn/api/v1/user/show_address_user",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer $access"
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final parsedAddress =
          json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      return parsedAddress
          .map<Address>((value) => Address.internalFromJson(value))
          .toList();
    }
    return Future.error("error");
  }

}