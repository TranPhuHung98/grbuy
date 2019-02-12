import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';

class ViewMore extends StatefulWidget {
  AppBloc appBloc ;
  CategaryItem categaryItem;
  ViewMore({Key key ,this.categaryItem,this.appBloc}) : super(key : key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ViewMoreState();
  }
}

class _ViewMoreState extends State<ViewMore> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(180, 11, 204, 200),
          title: Text(widget.categaryItem.name),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                ModelProductsItem(product:widget.categaryItem.products[index],appBloc: widget.appBloc,),
            itemCount: widget.categaryItem.products.length,
          ),
        ));
  }
}
