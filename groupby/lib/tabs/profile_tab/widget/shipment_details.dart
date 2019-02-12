import 'package:bigdeals2/parse_number.dart';
import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ShipmentDetails extends StatefulWidget {
  AppBloc appBloc;
  int money;
  ShipFee shipFee = ShipFee() ;
  CreatOrder creatOder = CreatOrder() ;
  GetAddress getAddress = GetAddress() ;
  List<ProductsItem> products = List();
  Address address = Address() ;
  ShipmentDetails(
      {Key key, this.appBloc, this.money, this.products,this.address})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ShipmentDetailsState();
  }
}

class ShipmentDetailsState extends State<ShipmentDetails> {
  ParseNumber parse = ParseNumber();
  final Store<AppStateCart> store = Store<AppStateCart>(
    appReducer,
    initialState: AppStateCart.initial(),
  );
  int ship;
  List<Address> list = List();
  _fetchAddress() async {
    var address = await widget.getAddress.getAddressUser(widget.appBloc.getAccessToken());
    setState(() {
      list.addAll(address);
      if(widget.address != null)
        widget.address = list[0];
    });
  }

  @override
  void initState() {
    super.initState();
    _loadShip();
    _fetchAddress();
  }

  _loadShip() async {
    setState(() {
      widget.shipFee.fetchFee().then((onValue) => ship = onValue);
    });
  }

  @override
  Widget build(BuildContext context) => StoreConnector<AppStateCart, ViewModel>(
      converter: (Store<AppStateCart> store) => ViewModel.create(store),
      builder: (BuildContext context, ViewModel viewModel) => Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Color.fromARGB(180, 11, 204, 200),
              title: Text('Xác thực và tạo đơn hàng',style: TextStyle(fontSize: 15),),
            ),
            body: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Địa chỉ giao hàng',style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.w600)),
                      FlatButton(
                        child: Text(
                          'Sửa',
                          style: TextStyle(color: Colors.blue,fontSize: 13),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyAddressEdit(
                                      appBloc: widget.appBloc,money: widget.money,products: widget.products,
                                    )),
                          );
                        },
                      )
                    ],
                  ),
                ),
                Divider(),
                Container(
                  width: double.infinity,
                  child:
                      list.length != 0 ? AddressItem(widget.address) : Container(),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              height: 120,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                        height: 40.0,
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Tổng cộng: '),
                              Text(parse.parseNumber((widget.money+30000).toString()),style: TextStyle(color: Colors.red,fontSize: 13),),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                  Container(
                    margin: EdgeInsets.only(left: 20.0,right: 20.0),
                    child: MaterialButton(
                      child: Text(
                        'Đặt Hàng',
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                      height: 40.0,
                      minWidth: double.infinity,
                      elevation: 0,
                      color: Color.fromARGB(180, 11, 204, 200),
                      onPressed: () {
                        print(widget.address.receiver);
                        print(widget.address.phone_number);
                        widget.creatOder
                            .creatOrders(widget.address, widget.products,widget.appBloc.getAccessToken())
                            .then((onValue) {
                          showDialog(
                              context: context, child : AddItemDialog(message: onValue));
                          if (onValue == 'success') viewModel.removeAll();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ));
}
