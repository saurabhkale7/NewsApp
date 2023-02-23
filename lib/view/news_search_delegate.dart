import 'package:flutter/material.dart';

import '../constants/constant_widgets.dart';
import '../model/news_model.dart';

class NewsSearchDelegate extends SearchDelegate {
  NewsSearchDelegate(
      {Key? key, required this.techModels, required this.newsCategory});

  final String newsCategory;
  List<NewsModel> techModels;
  List<NewsModel> matchQuery = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }


  void getData(){
    matchQuery = [];
    for (NewsModel x in techModels) {
      if (x.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(x);
      }
    }
  }


  @override
  Widget buildResults(BuildContext context) {
    getData();
    return getPage(context, matchQuery, newsCategory);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    getData();
    return getPage(context, matchQuery, newsCategory);
  }
}
