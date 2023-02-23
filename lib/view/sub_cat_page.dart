import "package:flutter/material.dart";
import '../constants/str_constants.dart';
import '../view/my_grid_view.dart';

import '../constants/constant_widgets.dart';

class NextPage extends StatefulWidget {
  NextPage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<NextPage> createState() => _NextPageState(index: index);
}

class _NextPageState extends State<NextPage> {
  _NextPageState({required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE6E6FA),
      appBar: getAppBar(StrConstants.newsApp),
      body: Padding(
        //color: Color(0xffE6E6FA),
        padding: const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(StrConstants.myArray[0][index], style: getTitleStyle,),
            sizedBox,
            Expanded(child: MyGridView(index: index)),
          ],
        ),
      ),
    );
  }
}
