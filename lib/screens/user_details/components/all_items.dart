//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';

import '../../../size_config.dart';

//------------------------ CLASS DECLARATION -------------------------//
class AllItems extends StatelessWidget {
  const AllItems({
    Key key,
    @required this.tappedUser,
    this.press,
    this.text,
  });

  final tappedUser;
  final GestureTapCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: press,
          child: Container(
            width: SizeConfig.screenWidth * 0.25,
            child: Row(
              children: [Text(text), Icon(Icons.arrow_forward)],
            ),
          ),
        ),
      ],
    );
  }
}
//------------------------------- EOF -------------------------------//