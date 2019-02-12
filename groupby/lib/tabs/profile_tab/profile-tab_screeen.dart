import 'package:bigdeals2/tabs/tabs.dart';
import 'package:flutter/material.dart';
import 'package:bigdeals2/app_bloc.dart';

class ProfileScreen extends StatefulWidget {
  final AppBloc appBloc;
  ForgotPass forgotPass;
  ProfileScreen({Key key, this.appBloc, this.forgotPass}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _userNameLoginTextController;
  TextEditingController _passwordLoginTextController;

  TextEditingController _userNameRegisterTextController;
  TextEditingController _passwordRegisterTextController;
  TextEditingController _comfirmRegisterPasswordsTextController;
  var _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _userNameLoginTextController = new TextEditingController();
    _passwordLoginTextController = new TextEditingController();
    _userNameRegisterTextController = new TextEditingController();
    _passwordRegisterTextController = new TextEditingController();
    _comfirmRegisterPasswordsTextController = new TextEditingController();
  }

  String title = "Đăng Nhập";
  bool login = true;
  Color colorIsChoosed = Color.fromARGB(180, 11, 204, 200);
  Color colorIsntChoosed = Colors.white;
  var _padding = EdgeInsets.only(left: 10.0, right: 10.0);
  int _radioValue1 = -1;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    // appBar: AppBar(
    //   elevation: 0,
    //   title: Text(login ? "Đăng Nhập" : "Đăng Ký"),
    //   centerTitle: true,
    //   backgroundColor: colorIsChoosed,
    // ),
    // backgroundColor: Colors.grey[100],
    return Container(
      // color: Colors.grey[100],
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 0),
            height: 55,
            color: colorIsChoosed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  login ? "Đăng Nhập" : "Đăng kí",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            elevation: 0,
            margin: EdgeInsets.all(7),
            child: Container(
              // margin: _padding,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 140,
                          height: 40,
                          decoration: BoxDecoration(
                              color: login ? colorIsChoosed : colorIsntChoosed,
                              border: Border.all(color: colorIsChoosed),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8))),
                          child: MaterialButton(
                            elevation: 0,
                            child: Text(
                              'Đăng nhập',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: login
                                      ? colorIsntChoosed
                                      : colorIsChoosed),
                            ),
                            onPressed: (() {
                              setState(() {
                                login = true;
                              });
                            }),
                          ),
                        ),
                        Container(
                          width: 140,
                          height: 40,
                          decoration: BoxDecoration(
                              color: login ? colorIsntChoosed : colorIsChoosed,
                              border: Border.all(color: colorIsChoosed),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8))),
                          child: MaterialButton(
                            elevation: 0,
                            child: Text('Đăng kí',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: login
                                        ? colorIsChoosed
                                        : colorIsntChoosed)),
                            // color: login ? colorIsntChoosed : colorIsChoosed,
                            onPressed: (() {
                              setState(() {
                                login = false;
                              });
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 14),
                    child: Center(
                      child: Text(
                        login ? 'ĐĂNG NHẬP' : "ĐĂNG KÝ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: login
                        ? _userNameLoginTextController
                        : _userNameRegisterTextController,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: login
                        ? _passwordLoginTextController
                        : _passwordRegisterTextController,
                    decoration: InputDecoration(
                      labelText: "Mật khẩu",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                  ),
                  login
                      ? Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 8, bottom: 8,right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              FlatButton(
                                padding: EdgeInsets.only(left: 0, top: 5),
                                child: Text(
                                  'Quên mật khẩu',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => ForgotPassScreen()));
                                },
                                color: Colors.white,
                                highlightColor: Colors.white,
                                disabledColor: Colors.white,
                                splashColor: Colors.white,
                              ),
                            ],
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            controller: _comfirmRegisterPasswordsTextController,
                            decoration: InputDecoration(
                              labelText: "Nhập lại mật khẩu",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                          ),
                        ),
                  login
                      ? SizedBox()
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                              activeColor: colorIsChoosed,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: 0,
                              groupValue: _radioValue1,
                              onChanged: _handleRadioValueChange1,
                            ),
                            Text('Nam'),
                            SizedBox(
                              width: 40,
                            ),
                            Radio(
                              activeColor: colorIsChoosed,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: 1,
                              groupValue: _radioValue1,
                              onChanged: _handleRadioValueChange1,
                            ),
                            Text('Nữ'),
                            SizedBox(
                              width: 40,
                            ),
                            Radio(
                              activeColor: colorIsChoosed,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: 2,
                              groupValue: _radioValue1,
                              onChanged: _handleRadioValueChange1,
                            ),
                            Text('Bí mật'),
                          ],
                        ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: RaisedButton(
                        elevation: 0,
                        child: Text(
                          login ? 'ĐĂNG NHẬP' : "ĐĂNG KÝ",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (login)
                            widget.appBloc.postLodgin(
                                _userNameLoginTextController.text,
                                _passwordLoginTextController.text);
                          else if (!login) if (_comfirmRegisterPasswordsTextController
                                  .text ==
                              _passwordRegisterTextController.text)
                            widget.appBloc.postRegister(
                                _userNameRegisterTextController.text,
                                _passwordRegisterTextController.text);
                        },
                        color: colorIsChoosed,
                      ),
                      height: 50,
                      width: 400,
                    ),
                  ),
                ],
              ),
            ),
            // ),
          ),
        ],
      ),
    );
  }
}