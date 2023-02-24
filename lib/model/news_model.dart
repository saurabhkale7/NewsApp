import '../constants/str_constants.dart';

class NewsModel{
  final Map<String,dynamic> source;
  final String author;
  final String title;
  final String desc;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String? content;

  NewsModel({
    required this.source, required this.author, required this.title, required this.desc, required this.url, required this.urlToImage, required this.publishedAt, required this.content});

  factory NewsModel.jsonToObject(Map<String, dynamic> json)=>NewsModel(
    source: json['source'] as Map<String, dynamic>,
    author: json['author']??StrConstants.emptyStr,
    title: json['title']??StrConstants.emptyStr,
    desc: json['desc']??StrConstants.emptyStr,
    url: json['url']??StrConstants.emptyStr,
    urlToImage: json['urlToImage']??StrConstants.emptyStr,
    publishedAt: json['publishedAt']??StrConstants.emptyStr,
    content: json['content']??StrConstants.emptyStr,
  );


}