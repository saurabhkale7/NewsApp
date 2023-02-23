import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import '../constants/api_constants.dart';
import '../model/news_model.dart';
import '../model/result.dart';
import '../constants/str_constants.dart';

class NewsModelAPI {
  Future<Result> getAll(String newsCategory) async {
    final String url;

    if (newsCategory == StrConstants.myArray[2][0]) {
      url = APIConstants.topHeadlines+StrConstants.ind;
    } else if (newsCategory == StrConstants.myArray[2][1]) {
      url = APIConstants.topHeadlines+StrConstants.us;
    } else if (newsCategory == StrConstants.myArray[2][2]) {
      url = APIConstants.topHeadlines+StrConstants.gb;
    } else if (newsCategory == StrConstants.myArray[2][3]) {
      url = APIConstants.topHeadlines+StrConstants.au;
    } else {
      url = APIConstants.everything+newsCategory;
      //debugPrint("ok josh");
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
