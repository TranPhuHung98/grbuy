import 'package:http/http.dart' as http;
import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';
class ChangePass {
  AppBloc appBloc = AppBloc() ;
  Future<String> changePassWord(
      String new_password, String current_password,String access) async {
    var response = await http.post(
        "https://groupbuy.vn/api/v1/user/change_password",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer ${access}"
        },
        body: {
          'new_password': new_password,
          'current_password': current_password,
        });
      return json.decode(response.body)["message"];
  }

}