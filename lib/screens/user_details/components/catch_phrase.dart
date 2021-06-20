//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';

//------------------------ CLASS DECLARATION -------------------------//
class CatchPhraseWidget extends StatelessWidget {
  const CatchPhraseWidget({

    @required this.tappedUser,
  }) ;

  final tappedUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, left: 20.0),
      child: Text.rich(
        TextSpan(
          text: 'Cath Phrase: \n\n',
          style: TextStyle(fontSize: 15.0),
          children: [
            TextSpan(
              text: '"${tappedUser.company['catchPhrase']}"',
              style: TextStyle(fontSize: 17.0, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
//------------------------------- EOF -------------------------------//