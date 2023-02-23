import 'package:flutter/foundation.dart';
import 'package:newsapp/api/newsmodel_api.dart';
import '../constants/str_constants.dart';
import '../model/result.dart';


class NewsModelProvider extends ChangeNotifier{
  final service=NewsModelAPI();
  bool isLoading=false;
  Result r=Result(msg: StrConstants.noOutput, newsModels: []);

  Future<void> getAllNews(String newsCategory) async{
    isLoading=true;
    notifyListeners();

    r=await compute(service.getAll, newsCategory);
    //newsModels=await service.getAll(newsCategory)

    isLoading=false;
    notifyListeners();
  }
}