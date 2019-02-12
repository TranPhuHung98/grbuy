import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';

class SilverAppBar extends StatelessWidget {
  AppBloc appBloc;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: true,
      floating: true,
      pinned: true,
      automaticallyImplyLeading: true,
      forceElevated: true,
      primary: true,
      backgroundColor: Color.fromARGB(180, 11, 204, 200),
      expandedHeight: 100.0,
      title: Container(
        margin: EdgeInsets.only( bottom: 20),
        child: Text(
          'GroupBuy',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      centerTitle: true,
      flexibleSpace: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0),color: Colors.white),
            margin: EdgeInsets.only(top: 65.0,left: 5.0,right: 5.0),
            height: 35.0,
                child: TextField(
                    obscureText: true,
                    decoration: (InputDecoration(
                        suffixIcon: Icon(
                          Icons.search,
                          size: 15.0,
                        ),
                        hintText: 'Tìm kiếm...',
                        hintStyle: TextStyle(fontSize: 15.0),
                        contentPadding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
                        border: OutlineInputBorder()))),
              ),
          
    );
  }
}
