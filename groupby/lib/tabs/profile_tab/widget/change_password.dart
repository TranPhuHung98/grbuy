import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';

class ChangePassWord extends StatefulWidget {
  AppBloc appBloc;
  ChangePass changePass = ChangePass();
  ChangePassWord({Key key, this.appBloc}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChangePassWordState();
  }
}

class ChangePassWordState extends State<ChangePassWord> {
  TextEditingController _currentPass;
  TextEditingController _newPass;
  TextEditingController _confirmPass;
  @override
  void initState() {
    super.initState();
    _currentPass = new TextEditingController();
    _newPass = new TextEditingController();
    _confirmPass = new TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _currentPass.dispose();
    _newPass.dispose();
    _confirmPass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(170, 0, 204, 204),
        title: Text('Thay đổi mật khẩu',style: TextStyle(fontSize: 15),),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            TextField(
                controller: _currentPass,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Mật Khẩu hiện tại',
                  hintStyle: TextStyle(fontSize: 13),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                )),
            TextField(
              controller: _newPass,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Mật khẩu mới',
                hintStyle: TextStyle(fontSize: 13),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              ),
            ),
            TextField(
              controller: _confirmPass,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Nhập lại mật khẩu',
                hintStyle: TextStyle(fontSize: 13),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0, left: 85.0, right: 85.0),
              child: MaterialButton(
                elevation: 0,
                height: 50.0,
                minWidth: 150.0,
                child: Text('Thay đổi', style: TextStyle(fontSize: 15.0,color: Colors.white),),
                color: Color.fromARGB(170, 0, 204, 204),
                onPressed: (() {
                  if (_confirmPass.text == _newPass.text)
                    widget.changePass
                        .changePassWord(_newPass.text, _currentPass.text,widget.appBloc.getAccessToken())
                        .then((onValue) {
                      if (onValue == 'success') 
                        widget.appBloc.postLogout();
                      showDialog(context: context,child: AddItemDialog(message: onValue,));
                    });
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
