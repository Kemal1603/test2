//------------------------- IMPORTED MODULES -------------------------//
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

//------------------------ CLASS DECLARATION -------------------------//
class Body extends StatelessWidget {
  Body({
    @required this.tappedAlbum,
  });

  final tappedAlbum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CarouselSlider(
        options: CarouselOptions(height: SizeConfig.screenHeight * 0.9),
        items: List.generate(25, (int index) => index + index).map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage('${tappedAlbum.photos[i].url}'),
                  ),
                ),
                width: SizeConfig.screenWidth,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  '${tappedAlbum.photos[i].title}',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
//------------------------------- EOF -------------------------------//
