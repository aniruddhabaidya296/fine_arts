// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:finearts/constants/colors.dart';
import 'package:finearts/constants/size_config.dart';
import 'package:finearts/models/painting.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaintingScreen extends StatefulWidget {
  final Painting painting;
  const PaintingScreen({Key key, this.painting}) : super(key: key);

  @override
  _PaintingScreenState createState() => _PaintingScreenState();
}

class _PaintingScreenState extends State<PaintingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(SizeConfig.blockWidth * 7),
                  bottomRight: Radius.circular(SizeConfig.blockWidth * 7),
                ),
              ),
              child: Image.asset(
                widget.painting.url,
                height: SizeConfig.blockHeight * 65,
                width: SizeConfig.screenWidth,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: SizeConfig.blockHeight * 4,
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 4),
              child: Text(
                widget.painting.title.toUpperCase(),
                style: TextStyle(
                  color: COLORS.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockHeight * 2,
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 4),
              child: Text(
                widget.painting.description,
                maxLines: 4,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: COLORS.greyMediumLight,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockHeight * 2,
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      details(
                          field: "Artist ", attribute: widget.painting.artist),
                      details(
                          field: "Price ",
                          attribute: "\$${widget.painting.price}"),
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: COLORS.deepBlue,
                    child: Text(
                      "BID",
                      style: TextStyle(
                          fontFamily: GoogleFonts.alegreyaSansSc().fontFamily,
                          color: COLORS.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  details({String field, String attribute}) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 4),
      child: Row(
        children: [
          Container(
            child: Text(
              "$field: ",
              style: TextStyle(
                color: COLORS.greyMediumLight,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: Text(
              attribute,
              style: TextStyle(
                color: COLORS.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
