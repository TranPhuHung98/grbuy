import 'package:bigdeals2/api/list_image_product_detail.dart';
import 'package:bigdeals2/parse_number.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:bigdeals2/tabs/tabs.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:bigdeals2/app_bloc.dart';

class ProductDetails extends StatefulWidget {
  
  AppBloc appBloc;
  ProductsItem product;
  CheckProduct checkProduct = CheckProduct();
  FetchProductDetail detail = FetchProductDetail() ;
  ProductDetails({Key key, this.product, this.appBloc}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ProductDetailsState();
  }
}

class ProductDetailsState extends State<ProductDetails> {
  ParseNumber parse = ParseNumber();
  List<String> listImage = List();
  FetchListImageProductDetail fetchList = FetchListImageProductDetail();
  loadImage() async{
    var nextImage =
    await fetchList.fechListImageProDetail(widget.product.id);
    setState(() {
      listImage.addAll(nextImage);
    });
  }
  final Store<AppStateCart> store = Store<AppStateCart>(
    appReducer,
    initialState: AppStateCart.initial(),
  );
  TextEditingController controller;
  @override
  void initState() {
    widget.detail.fetchProductDetail(widget.product.id).then((onValue){
      widget.product = onValue ;
    }) ;
    loadImage();
    //  if(widget.product.image_list == null)
    //     widget.product.image_list = List();
    //  widget.product.image_list?.add(widget.product.avatar_image);
    //  print(widget.product.image_list);
    super.initState();
    controller = new TextEditingController();
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => StoreConnector<AppStateCart, ViewModel>(
    converter: (Store<AppStateCart> store) => ViewModel.create(store),
    builder: (BuildContext context, ViewModel viewModel) => Scaffold(
      // appBar:  PreferredSize(
      //     preferredSize: Size.fromHeight(493.0), // here the desired height
      //     child: AppBar(
      //       elevation: 0,
      //       backgroundColor: Color.fromARGB(170, 0, 204, 204),
      //       centerTitle: true,
      //       title: Column(
      //         children: <Widget>[
      //           Container(
      //             margin: EdgeInsets.only(bottom: 20),
      //             child: Text(
      //               'Giỏ Hàng',
      //               style: TextStyle(fontSize: 15.0),
      //             ),
      //           ),
      //         ],
      //       ),
      //       flexibleSpace: Container(
      //         decoration: BoxDecoration(
      //           // border: Border.all(color: Colors.white),
      //           //   borderRadius: BorderRadius.circular(5.0),
      //             color: Colors.white),
      //         margin: EdgeInsets.only(top: 70.0),
      //         // height: 3.0,
      //         child: Column(
      //           children: <Widget>[
      //                   Container(
      //             height: 300.0,
      //             width: double.infinity,
      //             // padding: EdgeInsets.only(
      //             //     left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
      //             decoration: BoxDecoration(color: Colors.blueGrey[100]),
      //             // child: Carousel(
      //             //     boxFit: BoxFit.cover,
      //             //     images: widget.product.image_list
      //             //         .map((url) => NetworkImage(url))
      //             //         .toList(),
      //             //   )
      //             child: Container(
      //               margin: EdgeInsets.only(top: 10,bottom: 10),
      //               child: Image.network(widget.product.avatar_image)),
      //           ),
      //           Container(
      //             padding: EdgeInsets.all(10.0),
      //             child: Text(widget.product.name,
      //                 style: TextStyle(
      //                     color: Colors.black,
      //                     fontSize: 15.0)),
      //           ),
      //           Container(
      //             padding: EdgeInsets.all(10.0),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: <Widget>[
      //                 Text(
      //                   widget.product.price_deal.toString(),
      //                   style: TextStyle(
      //                       color: Color.fromARGB(150, 7, 239, 204),
      //                       fontWeight: FontWeight.w700,
      //                       fontSize: 15.0),
      //                 ),
      //                 Row(
      //                   children: <Widget>[
      //                     Icon(Icons.grade),
      //                     Text(
      //                       widget.product.amount_sale.toString() +
      //                           '/' +
      //                           widget.product.amount_target.toString(),
      //                       style: TextStyle(color: Colors.grey,fontSize: 12),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Container(
      //               padding: EdgeInsets.only(left: 10.0),
      //               child: Text(
      //                 widget.product.price.toString(),
      //                 style: TextStyle(
      //                     color: Colors.grey,
      //                     fontStyle: FontStyle.italic,
      //                     fontWeight: FontWeight.w300,
      //                     fontSize: 10.0,
      //                     decoration: TextDecoration.lineThrough),
      //               )),
      //           Divider(),
      //           Container(
      //             margin: EdgeInsets.only(left: 10.0),
      //             child: Text("Chi tiết sản phẩm",style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.w600),)),
      //           Divider(),
      //           ],
      //         )
      //       ),
      //     ),
      //   ),

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color.fromARGB(180, 83, 219, 219),
        title: Text(widget.product.name,style: TextStyle(fontSize: 13)),
      ),

      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            width: double.infinity,
            padding: EdgeInsets.only(
                left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
            decoration: BoxDecoration(color: Colors.blueGrey[100]),
            child:listImage.length == 0 ? Image.network(widget.product.avatar_image)
                : Carousel(
              dotSize: 5.0,
              dotSpacing: 10.0,
              dotBgColor: Colors.white.withOpacity(0.0),
              overlayShadow: false,
              boxFit: BoxFit.cover,
              images: listImage
                  .map((url) => NetworkImage(url))
                  .toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(widget.product.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0)),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  parse.parseNumber(widget.product.price_deal.toString()),
                  style: TextStyle(
                      color: Color.fromARGB(150, 7, 239, 204),
                      fontWeight: FontWeight.w700,
                      fontSize: 15.0),
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.grade),
                    Text(
                      widget.product.amount_sale.toString() +
                          '/' +
                          widget.product.amount_target.toString(),
                      style: TextStyle(color: Colors.grey,fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                parse.parseNumber(widget.product.price.toString()),
                style: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                    fontSize: 13.0,
                    decoration: TextDecoration.lineThrough),
              )),
          Divider(),
          Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Text("Chi tiết sản phẩm",style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.w600),)),
          Divider(),
          // Container(
          //     padding: EdgeInsets.all(10),
          //     child: HtmlView(data: widget.product.description)
          // ),
        ],
      ),
      bottomNavigationBar: Material(
        child: MaterialButton(
          elevation: 0,
          child: Text('Mua Ngay',style: TextStyle(color: Colors.white,fontSize: 15),),
          height: 50.0,
          minWidth: double.infinity,
          color: Color.fromARGB(170, 0, 204, 204),
          onPressed: () {
            widget.checkProduct
                .postCheckProduct(
                widget.product.id.toString(),
                widget.product.current_deal_id.toString(),
                1.toString(),
                widget.appBloc.getAccessToken())
                .then((value) {
              showDialog(
                  context: context,
                  child: AddItemDialog(message: value));
              if (value == 'success') {
                widget.product.quantity = 1;
                viewModel.onAddItem(widget.product);
              }
            });
          },
        ),
      ),
    ),
  );
}
