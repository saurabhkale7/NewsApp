import 'package:flutter/material.dart';
import 'package:newsapp/constants/nav_constants.dart';
import 'package:newsapp/constants/str_constants.dart';
import 'package:newsapp/view/home.dart';
import 'package:newsapp/view/news_page.dart';
import 'package:newsapp/view/next_page.dart';

class CustomRoute {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case NavConstants.home:
        return MaterialPageRoute(builder: (_)=> const Home());//StrConstants.myArray[index+1][i]
      case NavConstants.nextPage:
        return MaterialPageRoute(builder: (_)=> NextPage(index: (settings.arguments as int)));
      case NavConstants.newsPage:
        return MaterialPageRoute(builder: (_)=> NewsPage(newsCategory: (settings.arguments as String)));
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