import "package:flutter/material.dart";
import 'package:newsapp/constants/constant_widgets.dart';
import 'package:newsapp/constants/nav_constants.dart';
import 'package:newsapp/constants/str_constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Text> li = <Text>[
    Text(StrConstants.myArray[0][0], style: getTextStyle(),),
    Text(StrConstants.myArray[0][1], style: getTextStyle(),),
    Text(StrConstants.myArray[0][2], style: getTextStyle(),),
    Text(StrConstants.myArray[0][3], style: getTextStyle(),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE6E6FA) ,
      appBar: AppBar(
        title: const Text(StrConstants.newsApp),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        //color: Color(0xffE6E6FA),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(StrConstants.getNews, style: TextStyle(fontSize: 64,),),
            const SizedBox(height: 20,),
            GridView.builder(
                shrinkWrap: true,
                itemCount: StrConstants.myArray[0].length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int i){
                  return InkWell(
                    child: Card(
                      color: Colors.pink,
                      //elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.transparent),
                      ),
                      child: Align(alignment: Alignment.center, child: Text(StrConstants.myArray[0][i], style: getTextStyle(),)),
                    ),
                    onTap: (){
                      Navigator.of(context).pushNamed(NavConstants.nextPage, arguments: i);
                    },
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
