import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import '../constants/api_constants.dart';
import '../model/news_model.dart';
import '../model/result.dart';
import '../constants/str_constants.dart';

class NewsModelAPI {
  Future<Result> getAll(String newsCategory) async {
    String url="";
    bool flag=false;

    for(int i=0;i<StrConstants.myArray[3].length;i++){
      if(newsCategory.compareTo(StrConstants.myArray[3][i])==0){
        url = APIConstants.topHeadlines+StrConstants.countryCodes[i];
        flag=true;
        break;
      }
    }

    if(flag==false) {
      url = APIConstants.everything+newsCategory;
    }

    try {
      final Uri uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final dict = jsonDecode(response.body) as Map<String, dynamic>;
        final li = dict[StrConstants.articles] as List;

        List<NewsModel> data =li
                .map((dynamic i) =>
                    NewsModel.jsonToObject(i as Map<String, dynamic>))
                .toList();

        return Result(
            msg: data.isEmpty? StrConstants.noNews : StrConstants.success,
            newsModels: data);
      } else {
        debugPrint("ok hi");
        return Result(
            msg: StrConstants.statusCode + response.statusCode.toString(),
            newsModels: []);
      }
    } catch (e) {
      return Result(msg: e.toString(), newsModels: []);
    }

    // return Result(msg: StrConstants.noOutput, newsModels: []);
  }
}
