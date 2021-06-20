//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';
import 'package:test_app/screens/user_details/components/user_album.dart';

import '../../../size_config.dart';

//------------------------ CLASS DECLARATION -------------------------//
class Body extends StatelessWidget {
  const Body({
    @required this.tappedUser,
  });
  final  tappedUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'All Albums of ${tappedUser.name}',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.02,
        ),
        Container(
          height: SizeConfig.screenHeight * 0.85,
          child: ListView.builder(
            itemCount: tappedUser.albums.length,
            itemBuilder: (context, index) =>
                UserAlbumsWidget(tappedUser: tappedUser, index: index),
          ),
        )
      ],
    );
  }
}
//------------------------------- EOF -------------------------------//