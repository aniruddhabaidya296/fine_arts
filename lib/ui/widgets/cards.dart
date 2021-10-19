// ignore_for_file: prefer_const_constructors

import 'package:finearts/constants/colors.dart';
import 'package:finearts/constants/size_config.dart';
import 'package:finearts/models/gallery.dart';
import 'package:finearts/models/painting.dart';
import 'package:finearts/ui/gallery.dart';
import 'package:finearts/ui/painting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

getHorizontalPaintings(BuildContext context) {
  List<Widget> horizontalPaintings = [];
  for (int i = 0; i < paintings.length; i++) {
    horizontalPaintings.add(
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaintingScreen(
                painting: paintings[i],
              ),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(right: SizeConfig.blockWidth * 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  // margin: EdgeInsets.only(right: SizeConfig.blockWidth * 6),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 2),
                  // ),
                  // clipBehavior: Clip.hardEdge,
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.zero,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.blockWidth * 2)),
                    child: Image.asset(
                      paintings[i].url,
                      width: SizeConfig.blockWidth * 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: SizeConfig.blockHeight * 1),
                // alignment: Alignment.center,
                child: Text(
                  paintings[i].title,
                  style: TextStyle(
                    color: COLORS.greyMediumLight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  return horizontalPaintings;
}

getHorizontalGalleries(BuildContext context) {
  List<Widget> horizontalGalleries = [];
  for (int i = 0; i < paintings.length; i++) {
    horizontalGalleries.add(
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GalleryScreen(
                gallery: galleries[i],
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: SizeConfig.blockWidth * 6),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.blockWidth * 2),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  galleries[i].url,
                  width: SizeConfig.blockWidth * 35,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.blockHeight * 1,
                  left: SizeConfig.blockWidth * 1),
              // width: SizeConfig.blockWidth * 30,
              alignment: Alignment.center,
              // color: Colors.red,
              child: Text(
                galleries[i].name,
                maxLines: 1,
                style: TextStyle(
                  fontSize: SizeConfig.blockWidth * 3,
                  color: COLORS.greyMediumLight,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  return horizontalGalleries;
}

Widget itemCard(
    {BuildContext context,
    Painting painting,
    bool added,
    VoidCallback onClick}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaintingScreen(
            painting: painting,
          ),
        ),
      );
    },
    child: Container(
      height: SizeConfig.blockHeight * 50,
      margin: EdgeInsets.only(bottom: SizeConfig.blockHeight * 3),
      child: InkWell(
        onTap: onClick,
        child: Neumorphic(
          style: NeumorphicStyle(
              depth: 5,
              intensity: 5,
              shape: NeumorphicShape.flat,
              color: COLORS.white),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        painting.url,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF000000),
                      Color(0xFFffffff).withOpacity(0),
                    ],
                    begin: FractionalOffset(0.0, 1),
                    end: FractionalOffset(0.0, 0.0),
                    stops: [0.0, 0.4],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(
                    bottom: SizeConfig.blockHeight * 2,
                    left: SizeConfig.blockWidth * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      painting.artist,
                      style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: SizeConfig.blockWidth * 3,
                          color: COLORS.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      painting.title,
                      style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: SizeConfig.blockWidth * 3,
                          color: COLORS.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

List<Gallery> galleries = [
  Gallery(url: "assets/images/gallery1.jpg", name: "The Getty Center"),
  Gallery(url: "assets/images/gallery2.jpg", name: "National Gallery of Art"),
  Gallery(url: "assets/images/gallery3.jpg", name: "Detroit Institute of Arts"),
  Gallery(url: "assets/images/gallery4.jpg", name: "The Frick Collection"),
  Gallery(url: "assets/images/gallery5.jpg", name: "Everard Read"),
];

List<Painting> paintings = [
  Painting(
      url: "assets/images/painting1.jpg",
      artist: "John Carter",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a dui luctus, mattis nibh sed, semper enim. Quisque luctus massa at ligula laoreet tincidunt. Suspendisse risus libero, ultrices quis velit nec, posuere pulvinar ligula. Maecenas quis orci sed dui sagittis facilisis. Curabitur vel orci ligula. ",
      price: "650",
      title: "Sunrise"),
  Painting(
    url: "assets/images/painting2.jpg",
    artist: "Anna Adam",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a dui luctus, mattis nibh sed, semper enim. Quisque luctus massa at ligula laoreet tincidunt. Suspendisse risus libero, ultrices quis velit nec, posuere pulvinar ligula. Maecenas quis orci sed dui sagittis facilisis. Curabitur vel orci ligula. ",
    price: "650",
    title: "Lonely girl",
  ),
  Painting(
    url: "assets/images/painting3.jpg",
    artist: "Anna Adam",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a dui luctus, mattis nibh sed, semper enim. Quisque luctus massa at ligula laoreet tincidunt. Suspendisse risus libero, ultrices quis velit nec, posuere pulvinar ligula. Maecenas quis orci sed dui sagittis facilisis. Curabitur vel orci ligula. ",
    price: "650",
    title: "Abstract",
  ),
  Painting(
    url: "assets/images/painting4.png",
    artist: "Anna Adam",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a dui luctus, mattis nibh sed, semper enim. Quisque luctus massa at ligula laoreet tincidunt. Suspendisse risus libero, ultrices quis velit nec, posuere pulvinar ligula. Maecenas quis orci sed dui sagittis facilisis. Curabitur vel orci ligula. ",
    price: "650",
    title: "A boat",
  ),
  Painting(
    url: "assets/images/painting5.jpg",
    artist: "Anna Adam",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a dui luctus, mattis nibh sed, semper enim. Quisque luctus massa at ligula laoreet tincidunt. Suspendisse risus libero, ultrices quis velit nec, posuere pulvinar ligula. Maecenas quis orci sed dui sagittis facilisis. Curabitur vel orci ligula. ",
    price: "650",
    title: "Food",
  ),
];
