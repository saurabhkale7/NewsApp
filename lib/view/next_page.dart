import "package:flutter/material.dart";
import 'package:newsapp/constants/str_constants.dart';
import 'package:newsapp/view/my_grid_view.dart';

class NextPage extends StatefulWidget {
  NextPage({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  State<NextPage> createState() => _NextPageState(index: index);
}

class _NextPageState extends State<NextPage> {
  _NextPageState({required this.index});
  int index;

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
            Text(StrConstants.myArray[0][index], style: const TextStyle(fontSize: 64,),),
            const SizedBox(height: 20,),
            MyGridView(index: index),
          ],
        ),
      ),
    );
  }
}
