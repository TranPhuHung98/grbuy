import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';

class MenuItem extends StatefulWidget {
  final AppBloc appBloc;
  FetchListCategories listCategories = FetchListCategories();
  MenuItem({
    Key key,
    this.appBloc,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MenuItemState();
  }
}

class _MenuItemState extends State<MenuItem> {
  @override
  void initState() {
    super.initState();
    _fetchListCategories();
  }

  List<ListCategories> categories = List();
  _fetchListCategories() async {
    var nextCategory = await widget.listCategories.fetchListCategories();
    setState(() {
      categories.addAll(nextCategory);
    });
  }

  _buildButtonMenu(ListCategories category) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15.0),
          child: MaterialButton(
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(60.0)),
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Container(
                    child: Image.network(category.image),
                    height: 30.0,
                  ),
                )),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductsOfCategories(
                            appBloc: widget.appBloc,
                            id_categories: category.id,
                            name_categories: category.name,
                          )));
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Text(
            category.name,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11.0),
          ),
        )
      ],
    );
  }

  _buildMenuItem() {
    return SliverList(
        delegate: SliverChildListDelegate([
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          color: Colors.white,
          child: Row(
              children: categories.map((category) {
            return Container(
              child: _buildButtonMenu(category),
            );
          }).toList()),
        ),
      )
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return _buildMenuItem();
  }
}
