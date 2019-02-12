import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';
import 'package:bigdeals2/search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  final AppBloc appBloc;
  HomeScreen({Key key, this.appBloc}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    _search(String text) {
      if (text != null && text != ' ' && text.length > 0)
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => SearchScreen(text: text, search: search)));
    }
    return Stack(
      children: <Widget>[
        ListItem(appBloc: widget.appBloc,),
        Container(
          height: 120,
          margin: EdgeInsets.all(0),
          child: Card(
            margin: EdgeInsets.all(0),
                    child: PreferredSize(
              preferredSize: Size.fromHeight(100.0), // here the desired height
              child: AppBar(
                elevation: 0,
                backgroundColor: Color.fromARGB(180, 11, 204, 200),
                centerTitle: true,
                title: Container(
                  // margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'GroupBuy',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white),
                  margin: EdgeInsets.only( top :80,left: 5.0, right: 5.0,bottom: 5.0),
                  height: 35.0,
                  child: TextField(
                      controller: search,
                      onSubmitted: _search,
                      decoration: (
                        InputDecoration(
                          border: InputBorder.none,
                          // helperText: 'Tìm kiếm..',
                        suffixIcon: Icon(
                          Icons.search,
                          size: 20.0,
                        ),
                        hintText: 'Tìm kiếm...',
                        hintStyle: TextStyle(fontSize: 12.0),
                        contentPadding: EdgeInsets.only(top:6,left: 5),
                      ))),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
