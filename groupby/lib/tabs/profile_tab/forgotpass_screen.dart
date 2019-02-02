import 'package:flutter/material.dart';
import 'package:bigdeals2/tabs/tabs.dart';

// class ForgotPassScreen extends StatefulWidget {
//   @override
//   ForgotPass forgotPass = ForgotPass();

//   ForgotPassScreen({Key key, this.forgotPass}) : super(key: key);

//   ForgotPassScreenState createState() {
//     return ForgotPassScreenState();
//   }
// }

// class ForgotPassScreenState extends State<ForgotPassScreen> {
//   TextEditingController _emailTextController;

//   @override
//   void initState() {
//     super.initState();
//     _emailTextController = new TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: new Container(
//           color: Colors.grey,
//           child: new Center(
// //              child: new ClipRect(
// //                child: new BackdropFilter(
//             child: new Container(
//               height: 250.0,
//               width: 350.0,
//               decoration: new BoxDecoration(color: Colors.white),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
//                     child: Text(
//                       'Mật khẩu mới sẽ được gửi đến email của bạn',
//                       style: TextStyle(fontSize: 15.0, color: Colors.black),
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 30.0),
//                     child: TextField(
//                       keyboardType: TextInputType.emailAddress,
//                       controller: _emailTextController,
//                       decoration: InputDecoration(
//                           // icon: Icon(Icons.perm_identity),
//                           hintText: 'Nhập email tại đây',
//                           contentPadding:
//                               EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10.0))),
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
//                     child: Material(
//                       borderRadius: BorderRadius.circular(10.0),
//                       child: MaterialButton(
//                         color: Colors.green,
//                         minWidth: 200.0,
//                         height: 42.0,
//                         highlightColor: Colors.grey,
//                         child: Text(
//                           'SEND',
//                           style: TextStyle(color: Colors.white, fontSize: 20.0),
//                         ),
//                         onPressed: () {
//                           widget.forgotPass
//                               .postForgotPassword(_emailTextController.text)
//                               .then((onValue) {
//                             showDialog(
//                                 context: context,
//                                 child: AddItemDialog(message: onValue));
//                           });
//                         },
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
// //              ),
//         ),
// //          ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

class ForgotPassScreen extends StatefulWidget {
    ForgotPass forgotPass = ForgotPass();
      ForgotPassScreen({Key key, this.forgotPass}) : super(key: key);
  @override
  _ForgotPassScreenState createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  Color colorIsChoosed = Color.fromARGB(180, 83, 219, 219);
    TextEditingController _emailTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = new TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Quên Mật Khẩu',style: TextStyle(fontSize: 15),),
        backgroundColor: colorIsChoosed,
      ),
      body: Center(
        child: Container(
          height: 500,
          child: Card(
            margin: EdgeInsets.all(7),
            child: Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              child: ListView(
                children: <Widget>[
                  Center(
                      child: Container(
                    child: Text(
                      'QUÊN MẬT KHẨU',
                      style: TextStyle(fontSize: 17),
                    ),
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                  )),
                  Text(
                    'Nếu bạn quên mật khẩu, hãy nhập địa chỉ email của bạn vào ô này và nhấp vào khôi phục mật khẩu. Bạn sẽ nhật được một mật khẩu mới và một liên kết để đăng nhập. Bạn có thể thay đổi sau.',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  TextFormField(
                    controller: _emailTextController,
                    decoration: InputDecoration(
                      labelText: "Nhập email",
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 15),
                      child: RaisedButton(
                        elevation: 0,
                        child: Text(
                          'KHÔI PHỤC MẬT KHẨU',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                            widget.forgotPass
                                .postForgotPassword(_emailTextController.text)
                                .then((onValue) {
                              showDialog(
                                  context: context,
                                  child: AddItemDialog(message: onValue));
                            });
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
          ),
        ),
      ),
    );
  }
}

