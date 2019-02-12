import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:bigdeals2/app_bloc.dart';
import 'package:bigdeals2/parse_number.dart';
import 'package:bigdeals2/tabs/tabs.dart';
// import 'package:bigdeals2/tabs/home/widget/product_details.dart';
import 'package:redux/redux.dart';

class ModelProductsItem extends StatefulWidget {
  CheckProduct checkProduct = CheckProduct();
  AppBloc appBloc;
  ProductsItem product;
  ModelProductsItem({Key key, this.product, this.appBloc}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ModelProductsItemState();
  }
}

class ModelProductsItemState extends State<ModelProductsItem> {
  ParseNumber parse = ParseNumber();
  var _color = Color.fromARGB(180, 11, 204, 200);
  @override
  Widget build(BuildContext context) => StoreConnector<AppStateCart, ViewModel>(
        converter: (Store<AppStateCart> store) => ViewModel.create(store),
        builder: (BuildContext context, ViewModel viewModel) => Container(
              child: Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetails(
                                product: widget.product,
                                appBloc: widget.appBloc,
                              )),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment(-1.0, -1.0),
                        children: <Widget>[
                          Image.network(
                            widget.product.avatar_image,
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: 200.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            width: double.infinity,
                            height: 35.0,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(200, 255, 128, 128),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(4),topRight: Radius.circular(4))),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                  size: 15.0,
                                ),
                                Container(
                                  width: 10.0,
                                ),
                                Text(
                                  'Time end: ' +
                                      DateFormat.jm()
                                          .add_yMMMMd()
                                          .format(new DateTime
                                                  .fromMicrosecondsSinceEpoch(
                                              widget.product.time_end *
                                                  1000000))
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0,top: 10),
                          child: Container(
                            padding: EdgeInsets.only(bottom: 0, top: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(widget.product.name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 13.0)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  height: 38,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: _color,
                                  ),
                                  child: MaterialButton(
                                    padding: EdgeInsets.only(left: 0,right: 0),
                                    elevation: 1,
                                    
                                    // color: _color,
                                    // minWidth: 15.0,
                                    // height: 30.0,
                                    highlightColor: Colors.grey,
                                    child: Text(
                                      'MUA NGAY',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                          fontSize: 12.0),
                                    ),
                                    onPressed: () {
                                      widget.checkProduct
                                          .postCheckProduct(
                                              widget.product.id.toString(),
                                              widget.product.current_deal_id
                                                  .toString(),
                                              1.toString(),
                                              widget.appBloc.getAccessToken())
                                          .then((value) {
                                        showDialog(
                                            context: context,
                                            child: AddItemDialog(
                                                message: value));
                                        if (value == 'success') {
                                          widget.product.quantity = 1;
                                          viewModel.onAddItem(widget.product);
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Container(child: Text(widget.product.brand,style: TextStyle(color: Colors.grey,fontSize: 11),),padding: EdgeInsets.only(left: 10,bottom: 8,top: 8),),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 5.0, bottom: 5.0, right: 10.0, left: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  parse.parseNumber(
                                    widget.product.price_deal.toString(),
                                  ),
                                  style: TextStyle(
                                      color: _color,
                                      // fontWeight: FontWeight.w500,
                                      fontSize: 16.0),
                                ),
                                Container(
                                  width: 20.0,
                                ),
                                Text(
                                  parse.parseNumber(
                                      widget.product.price.toString()),
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      // fontStyle: FontStyle.italic,
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.grey[700],
                                  size: 15,
                                ),
                                Container(
                                  width: 5,
                                ),
                                Text(
                                  widget.product.amount_sale.toString() +
                                      '/' +
                                      widget.product.amount_target.toString(),
                                  style: TextStyle(
                                      color: Colors.grey[700], fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
      );
}
