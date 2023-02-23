import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/constants/str_constants.dart';
import 'dart:async';
import '../constants/constant_widgets.dart';
import '../constants/nav_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  //final IntTween animTween = IntTween(begin: 0, end: 4);
  final Tween<double> animTween = Tween(begin: 0, end: 1);
  late final AnimationController animCtrl;
  late final Animation anim;

  late bool flag;

  @override
  void initState() {
    super.initState();
    flag=false;
    animCtrl =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    anim = animTween.animate(animCtrl);
    Timer(
      const Duration(seconds: 5),
          () => Navigator.of(context).pushReplacementNamed(NavConstants.home),
    );
  }

  @override
  void dispose() {
    animCtrl.dispose();
    super.dispose();
  }

  // Future<bool> showPopUp() async {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: new Text('Confirm Exit?',
  //           style: new TextStyle(color: Colors.black, fontSize: 20.0)),
  //       content: new Text(
  //           'Are you sure you want to exit the app? Tap \'Yes\' to exit \'No\' to cancel.'),
  //       actions: <Widget>[
  //         new TextButton(
  //           onPressed: () {
  //             //this line exits the app.
  //             SystemChannels.platform
  //                 .invokeMethod('SystemNavigator.pop');
  //             //return true;
  //           },
  //           child:
  //           const Text('Yes', style: TextStyle(fontSize: 18.0)),
  //         ),
  //         new TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //             //return false;
  //           }, // this line dismisses the dialog
  //           child: new Text('No', style: new TextStyle(fontSize: 18.0)),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Future<bool> _onWillPop() {
    if(flag==false) {
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
      flag=true;
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    animCtrl.forward();
    return WillPopScope(
      onWillPop: _onWillPop,
      child: AnimatedBuilder(
        animation: anim,
        builder: (context, _) {
          int val=(animCtrl.value*10~/2);
          //int val=(animCtrl.value*10/2).toInt();
          val=val!=5?val:4;

          return Container(
            color: Color.lerp(Colors.deepPurple, Colors.white, animCtrl.value),
            alignment: Alignment.center,
            child: Image(image: images[val],),
            //child: Image(image: images[(animCtrl.value/2).toInt()],),


            //child:FlutterLogo(size:MediaQuery.of(context).size.height)
          );
        },
      ),
    );
  }
}
