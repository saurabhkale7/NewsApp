import 'package:flutter/material.dart';
import 'package:newsapp/constants/str_constants.dart';
import 'package:newsapp/state_management/newsmodel_provider.dart';
import 'package:provider/provider.dart';


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
      Provider.of<NewsModelProvider>(context, listen: false).getAllNews(newsCategory);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(newsCategory), backgroundColor: Colors.deepPurple,),
      body: Consumer<NewsModelProvider>(
          builder: (context1, value, child){
            if(value.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final techModels=value.newsModels;

            return ListView.builder(
              itemCount: techModels.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context1, index){
                final ob=techModels[index];

                return ListTile(
                  // leading: CircleAvatar(
                  //   child: Text((index+1).toString()),
                  //   backgroundColor: Colors.deepPurple,
                  // ),
                  contentPadding: const EdgeInsets.all(10),
                  title: Text(ob.title??StrConstants.notGiven, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24, decoration: TextDecoration.underline),),
                  subtitle: Column(
                    children: [
                      const SizedBox(height: 20,),
                      Text(ob.content==null?StrConstants.notGiven:"${StrConstants.tab} ${ob.content}", style: const TextStyle(color: Colors.black, fontSize: 22),),
                    ],
                  ),
                  tileColor: const Color(0xFFE6E6FA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.white),
                  ),
                );
              },
            );
          }
      ),
    );
  }
}



// class NewsPage extends StatelessWidget {
//   const NewsPage({Key? key, required this.news}) : super(key: key);
//   final String news;
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
