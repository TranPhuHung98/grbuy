import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';

class MyAddressEdit extends StatefulWidget {
  AppBloc appBloc;
  int money;
  List<ProductsItem> products;
  GetAddress getAddress = GetAddress() ;
  MyAddressEdit({Key key, this.appBloc, this.money, this.products})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MyAddressEditState();
  }
}

class MyAddressEditState extends State<MyAddressEdit> {
  List<Address> list = List();
  _fetchAddress() async {
    var address = await widget.getAddress.getAddressUser(widget.appBloc.getAccessToken());
    setState(() {
      list.addAll(address);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchAddress();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(180, 11, 204, 200),
        elevation: 0,
        centerTitle: true,
        title: Text('Địa chỉ của tôi',style: TextStyle(fontSize: 15),),
        actions: <Widget>[
          FlatButton(
            child: Text('Thêm',style: TextStyle(fontSize: 13),),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddAddress(
                          appBloc: widget.appBloc,
                        )),
              );
            },
          )
        ],
      ),
      body: ListView(
          children: list.map((address) {
        return Container(
          width: double.infinity,
          child: FlatButton(
            child: AddressItem(address),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShipmentDetails(
                          appBloc: widget.appBloc,
                          money: widget.money,
                          products: widget.products,
                          address: address,
                        )),
              );
            },
          ),
        );
      }).toList()),
    );
  }
}
