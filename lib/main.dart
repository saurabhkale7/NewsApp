import 'package:flutter/material.dart';
import 'package:newsapp/constants/str_constants.dart';
import 'package:provider/provider.dart';
import '../constants/nav_constants.dart';
import '../navigation/customroute.dart';
import '../state_management/newsmodel_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context)=>NewsModelProvider(),
      child: MaterialApp(
        title: StrConstants.newsApp,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: NavConstants.splashScreenPage,
        onGenerateRoute: CustomRoute.generateRoute,
      ),
    );
  }
}
