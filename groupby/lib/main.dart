import 'package:bigdeals2/app.dart';
import 'package:bigdeals2/app_bloc.dart';
import 'package:bigdeals2/tabs/tabs.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  AppBloc appBloc = AppBloc();
  runApp(new MyApp(
    appBloc: appBloc,
//    forgotPass: forgotPass,
  ));
}
