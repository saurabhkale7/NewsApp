import 'package:flutter/material.dart';
import 'package:newsapp/constants/constant_widgets.dart';
import 'package:newsapp/constants/nav_constants.dart';
import 'package:newsapp/constants/str_constants.dart';

class MyGridView extends StatefulWidget {
  MyGridView({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  State<MyGridView> createState() => _MyGridViewState(index: index);
}

class _MyGridViewState extends State<MyGridView> {
  _MyGridViewState({required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: StrConstants.myArray[index+1].length,
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
              child: Align(alignment: Alignment.center, child: Text(StrConstants.myArray[index+1][i], style: getTextStyle())),
            ),
            onTap: (){
              Navigator.of(context).pushNamed(NavConstants.newsPage, arguments: StrConstants.myArray[index+1][i]);
            },
          );
        }
    );
  }
}
