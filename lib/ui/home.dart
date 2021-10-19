// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:finearts/constants/colors.dart';
import 'package:finearts/constants/size_config.dart';
import 'package:finearts/ui/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: COLORS.primary,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.blockHeight * 7,
                  left: SizeConfig.blockWidth * 4),
              child: Text(
                "Gallery of",
                style: TextStyle(
                  color: COLORS.white,
                  // fontWeight: FontWeight.w900,
                  fontSize: SizeConfig.blockWidth * 4,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockHeight * 10,
                  horizontal: SizeConfig.blockWidth * 4),
              child: Text(
                "Finest Artworks",
                style: TextStyle(
                  color: COLORS.white,
                  fontWeight: FontWeight.w900,
                  fontSize: SizeConfig.blockWidth * 10,
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(SizeConfig.blockWidth * 7),
                      topRight: Radius.circular(SizeConfig.blockWidth * 7))),
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 10),
              margin: EdgeInsets.only(top: SizeConfig.blockHeight * 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: SizeConfig.blockHeight * 4,
                  ),
                  Text(
                    "FEATURED",
                    style: GoogleFonts.kronaOne(
                      fontSize: SizeConfig.blockWidth * 3,
                      letterSpacing: 0.2,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 36,
                    child:
                        // ShaderMask(
                        //   shaderCallback: (Rect bounds) {
                        //     return LinearGradient(
                        //       begin: Alignment.centerLeft,
                        //       end: Alignment.centerRight,
                        //       stops: [0.95, 1],
                        //       colors: <Color>[Colors.white, Colors.transparent],
                        //     ).createShader(bounds);
                        //   },
                        //   child:
                        ListView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.blockHeight * 2),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: getHorizontalPaintings(context),
                    ),
                    //   blendMode: BlendMode.dstIn,
                    // ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 4,
                  ),
                  Text(
                    "CURATED GALLERIES",
                    style: GoogleFonts.kronaOne(
                      fontSize: SizeConfig.blockWidth * 3,
                      letterSpacing: 0.2,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 24,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.blockHeight * 2),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: getHorizontalGalleries(context),
                    ),
                  ),
                  Text(
                    "TRENDING",
                    style: GoogleFonts.kronaOne(
                      fontSize: SizeConfig.blockWidth * 3,
                      letterSpacing: 0.2,
                    ),
                  ),
                  ListView.builder(
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockHeight * 2),
                    shrinkWrap: true,
                    itemCount: paintings.length,
                    itemBuilder: (context, i) {
                      return Container(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: SizeConfig.blockHeight * 3),
                              child: itemCard(
                                  context: context,
                                  painting: paintings[i],
                                  added: false),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
