import 'package:flutter/material.dart';
import '../constants/constant_widgets.dart';
import '../constants/nav_constants.dart';
import '../constants/str_constants.dart';

class MyGridView extends StatefulWidget {
  const MyGridView({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<MyGridView> createState() => _MyGridViewState(index: index);
}

class _MyGridViewState extends State<MyGridView> {
  _MyGridViewState({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        //physics: ScrollPhysics,
        shrinkWrap: true,
        itemCount: StrConstants.myArray[index + 1].length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
        itemBuilder: (BuildContext context, int i) {
          bool flag = false;
          if (StrConstants.myArray[index + 1][i].contains(StrConstants.space)) {
            flag = true;
          }

          return InkWell(
            //child: Ink(
            child: Card(
              //color: const Color(0xffE6E6FA),
              color: Colors.transparent,
              elevation: 10,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(20),
              //   side: const BorderSide(color: Colors.transparent, width: 5),
              // ),
              child: DecoratedBox(
                decoration: gradientDecoration(Colors.lightBlueAccent, Colors.deepPurpleAccent),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        flag == true
                            ? StrConstants.myArray[index + 1][i].split(StrConstants.space)[0]
                            : StrConstants.myArray[index + 1][i],
                        style: getGridTextStyle
                    ),

                    flag == true
                        ? Text(StrConstants.myArray[index + 1][i].split(StrConstants.space)[1], style: getGridTextStyle)
                        : const SizedBox(width: 0, height: 0,),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(NavConstants.newsPage,
                  arguments: StrConstants.myArray[index + 1][i]);
            },
          );
        });
  }
}
