import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:newsapp/api/newsmodel_api.dart';
import 'package:newsapp/model/news_model.dart';


class NewsModelProvider extends ChangeNotifier{
  final service=NewsModelAPI();
  bool isLoading=false;
  List<NewsModel> newsModels=[];

  Future<void> getAllNews(String newsCategory) async{
    isLoading=true;
    notifyListeners();

    newsModels=await compute(service.getAll, newsCategory);
    //newsModels=await service.getAll(newsCategory)

    isLoading=false;
    notifyListeners();
  }
}