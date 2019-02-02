import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';

class AddAddress extends StatefulWidget {
  ListAddress listAddress ;
  AppBloc appBloc;
  Add_Address add = Add_Address();
  AddAddress({Key key ,this.appBloc}): super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddAddressState();
  }
}

class AddAddressState extends State<AddAddress> {
  TextEditingController _receiver;
  TextEditingController _address;
  TextEditingController _phoneNumber;
  @override
  void initState() {
    super.initState();
    _receiver = new TextEditingController();
    _address = new TextEditingController();
    _phoneNumber = new TextEditingController();
  }
  @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      _receiver.dispose();
      _address.dispose();
      _phoneNumber.dispose();
    }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color.fromARGB(170, 0, 204, 204),
        title: Text('Thêm địa chỉ',style: TextStyle(fontSize: 15,),
      ),),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            TextField(
                controller: _receiver,
                decoration: InputDecoration(
                  hintText: 'Tên',hintStyle: TextStyle(fontSize: 12),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                )),
            TextField(
              controller: _address,
              decoration: InputDecoration(
                hintText: 'Địa chỉ',hintStyle: TextStyle(fontSize: 12)
,                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              ),
            ),
            TextField(
              controller: _phoneNumber,
              decoration: InputDecoration(
                hintText: 'Số điện thoại',hintStyle: TextStyle(fontSize: 12),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0,left: 85.0,right: 85.0),
              width: 60,
              height: 50,
              color: Color.fromARGB(170, 0, 204, 204),
              child: MaterialButton(
              elevation: 0,
              // height: 50.0,
              // minWidth: 70.0,
              child: Text('Gửi', style: TextStyle(fontSize: 15.0,color: Colors.white)),
              
              onPressed: (() {
                widget.add.addAddress(_receiver.text, _address.text, _phoneNumber.text,widget.appBloc.getAccessToken()).then((mess){
                  showDialog(context: context,child: AddItemDialog(message: mess,));
                }) ;
              }),
            ),
            )
          ],
        ),
      ),
    );
  }
}
