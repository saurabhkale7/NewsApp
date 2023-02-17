class NewsModel{
  final Map<String,dynamic> source;
  final String author;
  final String? title;
  final String desc;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String? content;

  NewsModel({
    required this.source, required this.author, required this.title, required this.desc, required this.url, required this.urlToImage, required this.publishedAt, required this.content});

  factory NewsModel.jsonToObject(Map<String, dynamic> json)=>NewsModel(
    source: json['source'] as Map<String, dynamic>,
    author: json['author'],
    title: json['title'],
    desc: json['desc'],
    url: json['url'],
    urlToImage: json['urlToImage'],
    publishedAt: json['publishedAt'],
    content: json['content'],
  );


}