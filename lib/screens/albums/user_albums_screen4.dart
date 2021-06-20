//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

//------------------------ CLASS DECLARATION -------------------------//
class AlbumsScreen extends StatelessWidget {
  static String routeName = '/albums';

  @override
  Widget build(BuildContext context) {
    final dynamic tappedUser = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.screenWidth * 0.5,
              top: SizeConfig.screenHeight * 0.01),
          child: Text('${tappedUser.name}'),
        ),
      ),
      body: Body(tappedUser: tappedUser),
    );

  }
}
//------------------------------- EOF -------------------------------//

