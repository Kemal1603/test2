//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';

//------------------------ CLASS DECLARATION -------------------------//
class DetailsTextWidget extends StatelessWidget {
  final String field;
  final String text;

  DetailsTextWidget({this.field, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, left: 20.0),
      child: Text.rich(TextSpan(
          text: '$text: \n',
          style: TextStyle(fontSize: 15.0),
          children: [
            TextSpan(
                text: field,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blueAccent,
                )),
          ])),
    );
  }
}
//------------------------------- EOF -------------------------------//