import 'package:flutter/material.dart';
import '../constants/nav_constants.dart';
import '../constants/str_constants.dart';
import '../view/details.dart';
import '../view/home.dart';
import '../view/news_page.dart';
import '../view/sub_cat_page.dart';
import '../view/splash_screen.dart';

class CustomRoute {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case NavConstants.splashScreenPage:
        return MaterialPageRoute(builder: (_)=> const SplashScreen());
      case NavConstants.home:
        return MaterialPageRoute(builder: (_)=> const Home());//StrConstants.myArray[index+1][i]
      case NavConstants.subCatPage:
        return MaterialPageRoute(builder: (_)=> NextPage(index: (settings.arguments as int)));
      case NavConstants.newsPage:
        return MaterialPageRoute(builder: (_)=> NewsPage(newsCategory: (settings.arguments as String)));
      case NavConstants.detailsPage:
        return MaterialPageRoute(builder: (_)=> Details(li: (settings.arguments as List)));
      default:
        return MaterialPageRoute(
          builder: (_)=> Scaffold(
            appBar: AppBar(title: const Text(StrConstants.error),),
            body: const Text(StrConstants.error),
          ),
        );
    }
  }
}