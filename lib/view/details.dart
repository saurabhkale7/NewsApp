import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/constant_widgets.dart';
import '../constants/str_constants.dart';

class Details extends StatelessWidget {
  const Details({Key? key, required this.li}) : super(key: key);
  final List li;

  // void goToUrl() async {
  //   var url = Uri.parse(li[1].url);
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw StrConstants.noUrl + url.toString();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(li[0]),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: commonPadding,
          child: Column(
            children: [
              Text(li[1].title, style: newsTitleStyle),
              sizedBox,
              getNetworkImage(li[1].urlToImage),
              Text(li[1].desc, style: newsDescStyle),
              Text(StrConstants.tab + li[1].content, style: newsContentStyle),
              sizedBox,
              TextButton(
                onPressed: () async {
                  try {
                    var url = Uri.parse(li[1].url);
                    //debugPrint("After parsing");
                    if (await canLaunchUrl(url)) {
                      //debugPrint("in can launch url");
                      await launchUrl(url);
                    } else {
                      //debugPrint("in throw");
                      throw StrConstants.noUrl + url.toString();
                    }
                  } catch (e) {
                    //debugPrint("in catch");
                    return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: roundRectBorder,
                          title: Text(
                            StrConstants.error,
                            style: alertTitleStyle,
                          ),
                          content: Text(
                            StrConstants.urlError + e.toString(),
                            style: alertContentStyle,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                //Navigator.pop(context);
                              },
                              child: const Text(StrConstants.ok),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: textBtnStyle,
                child: articleText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
