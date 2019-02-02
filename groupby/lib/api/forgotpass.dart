import 'package:http/http.dart' as http;
import 'package:bigdeals2/tabs/tabs.dart';
class ForgotPass{
  Future<String> postForgotPassword(String email) async {
    String messageForgot;
    BuildContext context;
    var response = await http.post(
        "https://groupbuy.vn/api/v1/forgot-password",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {'email': email});
    if (response.statusCode == 200) {
      messageForgot = json.decode(response.body)["message"];
      if (messageForgot == "success")
        Navigator.of(context).pushReplacementNamed('/');
    }
    return json.decode(response.body)["message"];
  }
}