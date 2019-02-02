// import 'dart:async';
// import 'package:bigdeals2/app_bloc.dart';
// import 'package:bigdeals2/app_state.dart';
// import 'package:bigdeals2/tabs/tabs.dart';

// class TabsScreen extends StatefulWidget {
//   final AppBloc appBloc;
//   TabsScreen({
//     Key key,
//     this.appBloc,
//   }) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return _TabsScreenState();
//   }
// }

// class _TabsScreenState extends State<TabsScreen>
//     with SingleTickerProviderStateMixin {
//   TabController controller;
//   bool _isLogged = false;
//   AppBar appbar = AppBar();

//   StreamSubscription<AppState> userSubcription;
//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       widget.appBloc.getAccessToken();
//       widget.appBloc.updateUser(AppState(widget.appBloc.getIsLoading()));
//       userSubcription = widget.appBloc.appState.listen((s) {
//         if (s.isLogged != _isLogged) {
//           setState(() {
//             _isLogged = s.isLogged;
//           });
//         }
//       });
//     });
//     controller = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//     userSubcription?.cancel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // setState(() {
//     //       if(controller.index==1)
//     //           appbar = AppBar(title: Text("hihi",));
//     //       if(controller.index==2)
//     //           appbar = AppBar(title: Text("haha",));
//     //        if(controller.index==3)
//     //           appbar = AppBar(title: Text("hehe",));
//     //     });
//       return Scaffold(
//         bottomNavigationBar: Container(
//           height: 60.0,
//           child: TabBar(
//             controller: controller,
//             indicatorColor:Color.fromARGB(170, 0, 204, 204),
//             labelColor: Color.fromARGB(170, 0, 204, 204),
//             unselectedLabelColor: Colors.grey,
//             tabs: <Tab>[
//               Tab(
//                 icon: Container(
//                   child: Icon(
//                     Icons.home,
//                     size: 30,
//                   ),
//                   margin: EdgeInsets.only(bottom: 0.0),
//                 ),
//                 text: "Trang chủ",
//               ),
//               Tab(
//                 icon: Container(
//                   child: Icon(
//                     Icons.shopping_cart,
//                     size: 30,
//                   ),
//                   margin: EdgeInsets.only(bottom: 0.0),
//                 ),
//                 text: "Giỏ hàng",
//               ),
//               Tab(
//                 icon: Container(
//                   child: Icon(
//                     Icons.perm_identity,
//                     size: 30,
//                   ),
//                   margin: EdgeInsets.only(bottom: 0.0),
//                 ),
//                 text: "Tài khoản",
//               )
//             ],
//           ),
//         ),
//         body: TabBarView(
//           controller: controller,
//           children: <Widget>[
//             HomeScreen(
//               appBloc: widget.appBloc,
//             ),
//             CartScreen(
//               appBloc: widget.appBloc,
//             ),
//             _isLogged
//                 ? LoggedScreen(
//                     appBloc: widget.appBloc,
//                   )
//                 : ProfileScreen(
//                     appBloc: widget.appBloc,
//                   )
//           ],
//         ),
//     );
//   }
// }
import 'dart:async';
import 'package:bigdeals2/app_bloc.dart';
import 'package:bigdeals2/app_state.dart';
import 'package:bigdeals2/tabs/tabs.dart';

class TabsScreen extends StatefulWidget {
  final AppBloc appBloc;
  TabsScreen({
    Key key,
    this.appBloc,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;
  bool _isLogged = false;

  StreamSubscription<AppState> userSubcription;
  @override
  void initState() {
    super.initState();
    setState(() {
      widget.appBloc.getAccessToken();
      widget.appBloc.updateUser(AppState(widget.appBloc.getIsLoading()));
      userSubcription = widget.appBloc.appState.listen((s) {
        if (s.isLogged != _isLogged) {
          setState(() {
            _isLogged = s.isLogged;
          });
        }
      });
    });
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    userSubcription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
          home: Scaffold(
          bottomNavigationBar: Material(
              color: Colors.white,
              child: Container(
                height: 60.0,
                child: TabBar(
                  controller: controller,
                indicatorColor: Color.fromARGB(170, 83, 219, 219),
                  labelColor: Color.fromARGB(170, 83, 219, 219),
                  unselectedLabelColor: Colors.grey,
                  tabs: <Tab>[
                    Tab(
                      icon: Container(
                        child: Icon(
                          Icons.home,
                          size: 28,
                        ),
                        margin: EdgeInsets.only(bottom: 0.0),
                      ),
                      text: "Trang chủ",
                    ),
                    Tab(
                      icon: Container(
                        child: Icon(
                          Icons.shopping_cart,
                          size: 28,
                        ),
                        margin: EdgeInsets.only(bottom: 0.0),
                      ),
                      text: "Giỏ hàng",
                    ),
                    Tab(
                      icon: Container(
                        // child: Icon(
                        //   Icons.perm_identity,
                        //   size: 28,
                        // ),
                        child: Image.asset('images/logo_account.png',height: 21,width: 21),
                        margin: EdgeInsets.only(bottom: 0.0),
                      ),
                      text: "Tài khoản",
                    )
                  ],
                ),
              )),
          body: TabBarView(
            controller: controller,
            children: <Widget>[
              HomeScreen(
                appBloc: widget.appBloc,
              ),
              CartScreen(
                appBloc: widget.appBloc,
              ),
              _isLogged
                  ? LoggedScreen(
                      appBloc: widget.appBloc,
                    )
                  : ProfileScreen(
                      appBloc: widget.appBloc,
                    )
            ],
          ),
        ),
    );
  }
}
