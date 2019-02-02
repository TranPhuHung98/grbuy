import 'package:rxdart/rxdart.dart';
import 'package:bigdeals2/app_state.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bigdeals2/tabs/tabs.dart';

class AppBloc {
  int check = 0;
  final _app_state = BehaviorSubject<AppState>();
  updateUser(AppState state) {
    _app_state.add(state);
  }
  Stream<AppState> get appState => _app_state.stream;
  bool isLoading = false;
  String _accessTokenLogin;
  Future<bool> saveLogged() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isLoadingSave =
        (sharedPreferences.getBool('isLoadingSave') ?? isLoading);
    if (check == 1) isLoadingSave = isLoading;
    await sharedPreferences.setBool('isLoadingSave', isLoadingSave);
    return isLoadingSave;
  }
  Future<String> saveaccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String saveAccess =
        (sharedPreferences.getString('saveAccess') ?? _accessTokenLogin);
    if (check == 1) saveAccess = _accessTokenLogin;
    print(check);
    await sharedPreferences.setString('saveAccess', saveAccess);
    return saveAccess ;
  }
  Future<String> postLodgin(String email, String password) async {
    var response =
        await http.post("https://groupbuy.vn/api/v1/login", headers: {
      "Content-Type": "application/x-www-form-urlencoded"
    }, body: {
      'grant_type': 'password',
      'client_id': '4',
      'client_secret': 'zGSTyJyXTMXFGQok1aLXA3tU8zO8ShtS16RcKEtN',
      'device_type': '1',
      'identifier':
          'ce777617da7f548fe7a9ab6febb56cf39fba6d382000c0395666288d961ee566',
      'email': email,
      'password': password
    });
    if (response.statusCode == 200) {
      if (json.decode(response.body)["message"] == "success") {
        _accessTokenLogin = await json.decode(response.body)["data"]["access_token"];
        isLoading = true;
        check = 1;
        saveLogged();
        saveaccessToken();
      } else {
        isLoading = false;
        check = 1;
        saveLogged();
      }
      updateUser(AppState(isLoading));
      return _accessTokenLogin;
    }
    updateUser(AppState(isLoading));
    return Future.error("error");
  }
  Future<String> postLogout() async {
      String auth = "Bearer ${getAccessToken()}" ;
    var response =
        await http.post("https://groupbuy.vn/api/v1/logout", headers: {
      "Authorization" : auth,
      "Accept":"application/json" ,
      "Content-Type": "application/x-www-form-urlencoded"
    });
    print(response.body);
    if (response.statusCode == 200) {
      if (json.decode(response.body)["message"] == "Logout successfully") {
        _accessTokenLogin ='null' ;
        isLoading = false;
        check = 1;
        saveLogged();
        saveaccessToken() ;
        updateUser(AppState(isLoading));
      }
    }
    return json.decode(response.body)["message"];
  }

  String _accessTokenRegister;
  Future<String> postRegister(String email, String password) async {
    var response = await http
        .post("https://groupbuy.vn/api/v1/register", headers: {
      "Content-Type": "application/x-www-form-urlencoded"
    }, body: {
      'email': email,
      'password': password,
      'birth_day': '123456',
      'gender': '0',
      'client_id': '4',
      'device_type': '0',
      'name': 'abc',
      'identifier':
          'ce777617da7f548fe7a9ab6febb56cf39fba6d382000c0395666288d961ee566',
      'client_secret': 'zGSTyJyXTMXFGQok1aLXA3tU8zO8ShtS16RcKEtN',
    });
    if (response.statusCode == 200) {
      if (json.decode(response.body)["message"] == "success") {
        _accessTokenRegister =
            json.decode(response.body)["data"]["access_token"];
                    _accessTokenLogin =
            json.decode(response.body)["data"]["access_token"];
        isLoading = true;
        check = 1;
        saveLogged();
       saveaccessToken();
      } else {
        _accessTokenLogin ='null' ;
        isLoading = false;
        check = 1;
        saveLogged();
        saveaccessToken();
      }
      updateUser(AppState(isLoading));
      return _accessTokenRegister;
    }
    return Future.error("error");
  }
  bool getIsLoading() {
    saveLogged().then((value) {
      isLoading = value;
    });
    saveLogged();
    return isLoading;
  }
  String getAccessToken(){
    saveaccessToken().then((onValue){
       _accessTokenLogin = onValue ;
    });
    print(_accessTokenLogin);
    saveaccessToken().then((onValue){
      _accessTokenLogin = onValue ;
    });
    return _accessTokenLogin ;
  }
}
