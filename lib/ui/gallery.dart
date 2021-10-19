// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:finearts/constants/colors.dart';
import 'package:finearts/constants/size_config.dart';
import 'package:finearts/models/gallery.dart';
import 'package:finearts/ui/widgets/cards.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  final Gallery gallery;
  const GalleryScreen({Key key, this.gallery}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.blockHeight * 7,
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 4),
              child: Text(
                widget.gallery.name,
                style: TextStyle(
                    fontSize: SizeConfig.blockWidth * 10,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockWidth * 4,
                  vertical: SizeConfig.blockHeight * 1),
              child: Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    size: SizeConfig.blockWidth * 5,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: SizeConfig.blockWidth * 1),
                    child: Text(
                      "Masachussets",
                      maxLines: 1,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: COLORS.greyMediumLight),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(
            //       horizontal: SizeConfig.blockWidth * 4,
            //       vertical: SizeConfig.blockHeight * 1),
            //   child: Row(
            //     children: [
            //       Icon(
            //         Icons.phone,
            //         size: SizeConfig.blockWidth * 5,
            //       ),
            //       Container(
            //         margin: EdgeInsets.only(left: SizeConfig.blockWidth * 1),
            //         child: Text(
            //           "+91 987654321",
            //           maxLines: 1,
            //           style: TextStyle(
            //               overflow: TextOverflow.ellipsis,
            //               color: COLORS.greyMediumLight),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.symmetric(
            //       horizontal: SizeConfig.blockWidth * 4,
            //       vertical: SizeConfig.blockHeight * 1),
            //   child: Row(
            //     children: [
            //       Icon(
            //         Icons.mail,
            //         size: SizeConfig.blockWidth * 5,
            //       ),
            //       Container(
            //         margin: EdgeInsets.only(left: SizeConfig.blockWidth * 1),
            //         child: Text(
            //           "examplegallery@gmail.com",
            //           maxLines: 1,
            //           style: TextStyle(
            //               overflow: TextOverflow.ellipsis,
            //               color: COLORS.greyMediumLight),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockWidth * 4,
                  vertical: SizeConfig.blockHeight * 2),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a dui luctus, mattis nibh sed, semper enim. Quisque luctus massa at ligula laoreet tincidunt.",
                style: TextStyle(
                  fontSize: SizeConfig.blockWidth * 4,
                  color: COLORS.greyMedium,
                ),
              ),
            ),
            GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockWidth * 4,
                  vertical: SizeConfig.blockHeight * 3),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: SizeConfig.blockWidth * 4,
                mainAxisSpacing: SizeConfig.blockHeight * 3,
                childAspectRatio: (1.1 / 1.25),
              ),
              shrinkWrap: true,
              itemCount: paintings.length,
              itemBuilder: (context, i) {
                return itemCard(
                  context: context,
                  painting: paintings[i],
                  added: false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
