import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/str_constants.dart';
import '../model/news_model.dart';
import '../state_management/newsmodel_provider.dart';
import '../constants/constant_widgets.dart';
import 'news_search_delegate.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key, required this.newsCategory}) : super(key: key);
  final String newsCategory;

  @override
  State<NewsPage> createState() => _NewsPageState(newsCategory: newsCategory);
}

class _NewsPageState extends State<NewsPage> {
  _NewsPageState({required this.newsCategory});

  final String newsCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<NewsModelProvider>(context, listen: false)
          .getAllNews(newsCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<NewsModel> techModels = [];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          newsCategory,
          style: appBarTextStyle,
        ),
        iconTheme: iconThemeData,
        backgroundColor: Colors.white,
        actions: [
          Consumer<NewsModelProvider>(builder: (context1, value, child) {
            return IconButton(
              onPressed: value.isLoading
                  ? null
                  : () {
                      // method to show the search bar
                      showSearch(
                          context: context,
                          // delegate to customize the search bar
                          delegate: NewsSearchDelegate(
                              techModels: techModels,
                              newsCategory: newsCategory));
                    },
              icon: const Icon(Icons.search),
            );
          }),
        ],
      ),
      backgroundColor: commonBackgroundColor,
      body: Consumer<NewsModelProvider>(builder: (context1, value, child) {
        if (value.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (value.r.msg.compareTo(StrConstants.success) != 0) {
          bool flag = false;
          if (value.r.msg.compareTo(StrConstants.noNews) == 0) {
            flag = true;
          }

          return AlertDialog(
            shape: roundRectBorder,
            title: Text(
              flag == true ? StrConstants.info : StrConstants.error,
              style: alertTitleStyle,
            ),
            content: Text(
              flag == true ? value.r.msg : StrConstants.tryAgain + value.r.msg,
              style: alertContentStyle,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    //Navigator.pop(context);
                  },
                  child: const Text(StrConstants.ok)),
            ],
          );
        } else {
          techModels = value.r.newsModels;

          return getPage(context, techModels, newsCategory);
        }
      }),
    );
  }
}
/*
*
*return ListView.builder(
            itemCount: techModels.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context1, index) {
              final NewsModel ob = techModels[index];

              return Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: ListTile(
                  // leading: CircleAvatar(
                  //   child: Text((index+1).toString()),
                  //   backgroundColor: Colors.deepPurple,
                  // ),
                  leading: SizedBox(width: 100, child: getNetworkImage(ob.urlToImage)),
                  contentPadding: const EdgeInsets.all(10),
                  title: Text(
                    ob.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  // subtitle: Column(
                  //   children: [
                  //     const SizedBox(
                  //       height: 20,
                  //     ),
                  //     Text(
                  //       ob.content == null
                  //           ? StrConstants.notGiven
                  //           : "${StrConstants.tab} ${ob.content}",
                  //       style: const TextStyle(color: Colors.black, fontSize: 22),
                  //     ),
                  //   ],
                  // ),
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.transparent),
                  ),
                  visualDensity: const VisualDensity(vertical: 4.0),
                  onTap: (){
                    Navigator.of(context).pushNamed(NavConstants.detailsPage, arguments: [newsCategory, ob]);
                  },
                ),
              );
            },
          );
*
*
* */
