import 'package:bigdeals2/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bigdeals2/tabs/tabs.dart';

class LoggedScreen extends StatefulWidget {
 final AppBloc appBloc;
 LoggedScreen({
   Key key,
   this.appBloc,
 }) : super(key: key);
 @override
 LoggedScreenState createState() {
   return LoggedScreenState();
 }
}

class LoggedScreenState extends State<LoggedScreen> {
 _buildRow(String title, Widget onTap) => Container(
       height: 50,
       // margin: EdgeInsets.only(left: 10, right: 10),
       decoration: BoxDecoration(border: Border.all(color: Colors.grey[300])),
       child: ListTile(
         title: Text(title),
         trailing: Icon(Icons.chevron_right),
         onTap: () {
           onTap != null
               ? Navigator.push(
                   context, MaterialPageRoute(builder: (context) => onTap))
               : null;
         },
       ),
     );

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       centerTitle: true,
       elevation: 0,
       backgroundColor: Color.fromARGB(180, 83, 219, 219),
       title: Text('Tài Khoản',style: TextStyle(fontSize: 15),),
     ),
     body: ListView(
       children: <Widget>[
         Container(
           padding: EdgeInsets.only(left: 120.0, right: 120.0, top: 20.0,bottom: 20),
           child: CircleAvatar(
             backgroundImage: AssetImage('images/stdio.jpg'),
             radius: 60.0,
           ),
         ),
         _buildRow(
             'Change password',
             ChangePassWord(
               appBloc: widget.appBloc,
             )),
         _buildRow(
             'My Address',
             MyAddress(
               appBloc: widget.appBloc,
             )),
        //  _buildRow('Orders History', null),
         FlatButton(
           padding: EdgeInsets.only(top: 30),
           child: Text(
             'Đăng xuất',
             style:
                 TextStyle(height: 0.0, fontSize: 20.0, color: Colors.red),
           ),
           onPressed: () {
             widget.appBloc.postLogout();
           },
         )
       ],
     ),
   );
 }
}