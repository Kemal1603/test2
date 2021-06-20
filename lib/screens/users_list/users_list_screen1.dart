//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';
import 'package:test_app/size_config.dart';

import 'components/body.dart';

//------------------------ CLASS DECLARATION -------------------------//
class UsersList extends StatelessWidget {
  static String routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Users List'),
      ),
      body: Body(),
    );

  }
}
//------------------------------- EOF -------------------------------//