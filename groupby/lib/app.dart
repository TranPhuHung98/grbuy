import 'package:bigdeals2/app_bloc.dart';
import 'package:bigdeals2/tabs/tabs.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:bigdeals2/splash/splash.dart';

class MyApp extends StatefulWidget {
  final AppBloc appBloc;
  MyApp({
    Key key,
    this.appBloc,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyState();
  }
}

class _MyState extends State<MyApp> {
  final Store<AppStateCart> store = Store<AppStateCart>(
    appReducer,
    initialState: AppStateCart.initial(),
  );
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: new MaterialApp(
        title: 'GroupBuy',
        debugShowCheckedModeBanner: false,
        initialRoute: "/splash",
        // home: SplashScreen(),
        routes: {
          "/splash": (context) => SplashScreen(),
          "/welcome": (context) => WelcomeScreen(),
          "/": (context) => TabsScreen(
                appBloc: widget.appBloc,
              ),
          "/logged": (context) => LoggedScreen(appBloc: widget.appBloc),
          "/changePassword": (context) => ChangePassWord(),
          "/my address": (context) => MyAddress(),
          "/Orders History": (context) => OrdersHistory(),
        },
      ),
    );
  }
}
