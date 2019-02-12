import 'package:bigdeals2/parse_number.dart';
import 'package:bigdeals2/tabs/tabs.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CartItem extends StatefulWidget {
  @override
  ProductsItem product;
  CartItem(this.product);
  State<StatefulWidget> createState() {
    return _CartItemState();
  }
}

class _CartItemState extends State<CartItem> {
  ParseNumber parse = ParseNumber();
  final Store<AppStateCart> store = Store<AppStateCart>(
    appReducer,
    initialState: AppStateCart.initial(),
  );
  @override
  Widget build(BuildContext context) => StoreConnector<AppStateCart, ViewModel>(
    converter: (Store<AppStateCart> store) => ViewModel.create(store),
    builder: (BuildContext context, ViewModel viewModel) =>
    // TODO: implement build
    Stack(
      alignment: Alignment(1.0, 1.0),
      children: <Widget>[
        Card(
          child: InkWell(
            onTap: null,
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Image.network(
                    widget.product.avatar_image,
                    fit: BoxFit.cover,
                    height: 100.0,
                    width: 100.0,
                  ),
                ),
                Container(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.product.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        parse.parseNumber(widget.product.price_deal.toString()),
                        style: TextStyle(
                            color: Color.fromARGB(180, 11, 204, 200),
                            fontWeight: FontWeight.w900),
                      ),
                      Text(parse.parseNumber(widget.product.price.toString()),
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                              fontWeight: FontWeight.w800)),
                      // Text('Số Lượng : ${widget.product.quantity}'),
                      Row(
                        children: <Widget>[
                          Text('Số lượng '),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.grey)),
                            // color: Colors.white,
                            height: 25,
                            width: 25,
                            child: RaisedButton(
                              padding: EdgeInsets.only(right: 3),
                              onPressed: () {
                                if(widget.product.quantity == 1)
                                  viewModel.onDeleteItem(widget.product);
                                else
                                  setState(() {
                                    widget.product.quantity =
                                        widget.product.quantity - 1;
                                  });
                              },
                              color: Colors.white,
                              child: Text("-"),
                            ),
                          ),
                          Container(
                            height: 25,
                            decoration: BoxDecoration(
                                border:
                                Border(bottom: BorderSide(color: Colors.grey),top: BorderSide(color: Colors.grey))),
                            child: Container(
                                margin:
                                EdgeInsets.only(right: 10, left: 10,top: 5,bottom: 7),
                                child: Text(
                                    ' ${widget.product.quantity}')),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.grey)),
                            // color: Colors.white,
                            height: 25,
                            width: 25,
                            child: RaisedButton(
                              padding: EdgeInsets.only(right: 3),
                              onPressed: () {
                                if(widget.product.quantity < 5)
                                  setState(() {
                                    widget.product.quantity =
                                        widget.product.quantity + 1;
                                  });
                              },
                              color: Colors.white,
                              child: Text("+"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.red,
          ),
          onPressed: () {
            viewModel.onDeleteItem(widget.product);
          },
        )
      ],
    ),
  );
}