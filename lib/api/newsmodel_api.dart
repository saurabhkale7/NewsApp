import 'package:http/http.dart' as http;
import 'package:newsapp/constants/api_constants.dart';
import 'package:newsapp/model/news_model.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

import '../constants/str_constants.dart';

class NewsModelAPI{
  Future<List<NewsModel>> getAll(String newsCategory) async {
    final String url;

    if(newsCategory==StrConstants.myArray[2][0]){
      url="${APIConstants.topHeadlines}in";
    } else if(newsCategory==StrConstants.myArray[2][1]){
      url="${APIConstants.topHeadlines}us";
    } else if(newsCategory==StrConstants.myArray[2][2]){
      url="${APIConstants.topHeadlines}gb";
    } else if(newsCategory==StrConstants.myArray[2][3]){
      url="${APIConstants.topHeadlines}au";
    } else{
      url="${APIConstants.everything}$newsCategory";
    }



    //const url="https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=fcfcbc293c904f43bb7a9fb43d31bdf4";


    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final dict = jsonDecode(response.body) as Map<String, dynamic>;
      final li=dict["articles"] as List;

      List<NewsModel> data = li!=null
                             ? li.map(
                                (dynamic i) => NewsModel.jsonToObject(i as Map<String, dynamic>)
                              ).toList()
                             : <NewsModel>[];

      return data;
    }else {
      debugPrint("ok hi");
    }
    return [];
  }
}