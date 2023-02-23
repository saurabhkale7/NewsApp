import 'package:flutter/material.dart';
import 'font_constants.dart';
import 'image_constants.dart';
import 'str_constants.dart';

import '../model/news_model.dart';
import 'nav_constants.dart';

TextStyle getGridTextStyle = const TextStyle(
  fontSize: 32,
  color: Colors.white,
  fontFamily: FontConstants.raleway,
);

TextStyle getTileTextStyle = getGridTextStyle;

TextStyle commonTextStyle = getGridTextStyle;

List<AssetImage> images = const [
  AssetImage(ImageConstants.launcherMdpi),
  AssetImage(ImageConstants.launcherHdpi),
  AssetImage(ImageConstants.launcherXhdpi),
  AssetImage(ImageConstants.launcherXxhdpi),
  AssetImage(ImageConstants.launcherXxxhdpi),
];

AppBar getAppBar(final String str) {
  return AppBar(
    title: Text(
      str,
      style: const TextStyle(
          color: Colors.black,
          fontSize: 28,
          fontFamily: FontConstants.raleway,
          fontWeight: FontWeight.bold),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
  );
}

TextStyle getTitleStyle = const TextStyle(
  fontSize: 64,
  fontFamily: FontConstants.junge,
  fontWeight: FontWeight.bold,
);

TextStyle newsTitleStyle = const TextStyle(
    fontSize: 52,
    fontFamily: FontConstants.raleway,
    fontWeight: FontWeight.bold);

TextStyle newsDescStyle =
    const TextStyle(fontSize: 32, fontFamily: FontConstants.raleway);

TextStyle newsContentStyle =
    const TextStyle(fontSize: 28, fontFamily: FontConstants.junge);

Image getNetworkImage(final String str) {
  Image image;
  try {
    image = Image.network(
      str,
      fit: BoxFit.fill,
      errorBuilder: (_, __, ___) {
        return Image(
          image: images[0],
          fit: BoxFit.fill,
        );
      },
    );
  } catch (e) {
    image = Image(
      image: images[0],
      fit: BoxFit.fill,
    );
  }
  return image;
}

dynamic textBtnStyle = TextButton.styleFrom(
  elevation: 2,
  backgroundColor: Colors.blue,
  shape: RoundedRectangleBorder(
    side: const BorderSide(
      width: 10,
      color: Colors.transparent,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
);

Text articleText = const Text(
  StrConstants.viewArticle,
  style: TextStyle(
      fontSize: 28, color: Colors.white, fontFamily: FontConstants.roboto),
);

SizedBox sizedBox = const SizedBox(height: 20);

EdgeInsets commonPadding = const EdgeInsets.all(10);

VisualDensity commonVisualDensity = const VisualDensity(
  vertical: 4.0,
);

BoxDecoration gradientDecoration(final Color a, final Color b) {
  return BoxDecoration(
    border: Border.all(color: Colors.transparent, width: 5),
    borderRadius: BorderRadius.circular(20),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [a, b],
    ),
  );
}

RoundedRectangleBorder roundRectBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
  side: const BorderSide(color: Colors.transparent),
);

Widget getPage(
    BuildContext context, List<NewsModel> techModels, String newsCategory) {
  return ListView.builder(
    itemCount: techModels.length,
    padding: commonPadding,
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
          contentPadding: commonPadding,
          title: Text(
            ob.title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: FontConstants.roboto,
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
          shape: roundRectBorder,
          visualDensity: commonVisualDensity,
          onTap: () {
            Navigator.of(context).pushNamed(NavConstants.detailsPage,
                arguments: [newsCategory, ob]);
          },
        ),
      );
    },
  );
}
