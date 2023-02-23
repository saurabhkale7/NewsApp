import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import '../constants/constant_widgets.dart';
import '../constants/font_constants.dart';
import '../constants/nav_constants.dart';
import '../constants/str_constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool flag = false;

  final List<Text> li = <Text>[
    Text(
      StrConstants.myArray[0][0],
      style: getTileTextStyle,
    ),
    Text(
      StrConstants.myArray[0][1],
      style: getTileTextStyle,
    ),
    Text(
      StrConstants.myArray[0][2],
      style: getTileTextStyle,
    ),
    Text(
      StrConstants.myArray[0][3],
      style: getTileTextStyle,
    ),
    Text(
      StrConstants.myArray[0][3],
      style: getTileTextStyle,
    ),
  ];

  Future<bool> _onWillPop() {
    if (flag == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(StrConstants.pressAgain),
          action: SnackBarAction(
            label: StrConstants.ok,
            onPressed: () {
              // Code to execute.
            },
          ),
        ),
      );
      flag = true;
      return Future.value(false);
    }

    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: const Color(0xffE6E6FA),
        appBar: AppBar(
          title: const Text(
            StrConstants.newsApp,
            style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontFamily: FontConstants.raleway,
                fontWeight: FontWeight.bold),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                _onWillPop();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Padding(
          //color: Color(0xffE6E6FA),
          padding: commonPadding,
          child: Column(
            children: [
              Text(
                StrConstants.getNews,
                style: getTitleStyle,
              ),
              sizedBox,
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: li.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
                      child: InkWell(
                        child: Container(
                          decoration: gradientDecoration(
                              Colors.pinkAccent, Colors.purple),
                          child: ListTile(
                            title: li[i],
                            //subtitle: Text("    ", style: TextStyle(fontSize: 20),),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(20),
                            //   side: const BorderSide(color: Colors.transparent),
                            // ),
                            //tileColor: Colors.white,
                            visualDensity: commonVisualDensity,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(NavConstants.subCatPage, arguments: i);
                        },
                      ),
                    );
                  },
                ),
              ),
              // GridView.builder(
              //     shrinkWrap: true,
              //     itemCount: StrConstants.myArray[0].length,
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
              //     itemBuilder: (BuildContext context, int i){
              //       return InkWell(
              //         child: Card(
              //           color: Colors.pink,
              //           //elevation: 20,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(20),
              //             side: const BorderSide(color: Colors.transparent),
              //           ),
              //           child: Align(alignment: Alignment.center, child: Text(StrConstants.myArray[0][i], style: getTextStyle(),)),
              //         ),
              //         onTap: (){
              //           Navigator.of(context).pushNamed(NavConstants.nextPage, arguments: i);
              //         },
              //       );
              //     },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
