//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';


//------------------------ CLASS DECLARATION -------------------------//
class AlbumDetails extends StatelessWidget {

  static String routeName = '/album_details';

  @override
  Widget build(BuildContext context) {
    /*--------------------- GET ALBUM WITH ALL PHOTO ---------------------*/
    final dynamic tappedAlbum = ModalRoute
        .of(context)
        .settings
        .arguments;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.screenWidth * 0.5,
              top: SizeConfig.screenHeight * 0.01),
          child: Text('Album № ${tappedAlbum.id}'),
        ),
      ),
      body: Body(tappedAlbum: tappedAlbum),

    );
  }
}

//------------------------------- EOF -------------------------------//
