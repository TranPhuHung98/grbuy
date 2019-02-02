import 'package:bigdeals2/tabs/tabs.dart';
import 'package:http/http.dart' as http;
class FetchSlide{
  Future<List<Slide>> fetchUiSlide() async {
    var response =
        await http.get("https://groupbuy.vn/api/v1/UI/slide");
    if (response.statusCode == 200) {
      if (json.decode(response.body)['message'] == "success") {
        final parsedSlide =
            json.decode(response.body)['data'].cast<Map<String, dynamic>>();
        print(response.body);
        return parsedSlide
            .map<Slide>((value) => Slide.internalFromJson(value))
            .toList();
      }
    }
    return Future.error("error");
  }
}