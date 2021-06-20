//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';
import 'package:test_app/routes.dart';
import 'package:test_app/screens/users_list/users_list_screen1.dart';



void main() {
  runApp(MyApp());
}
//------------------------ CLASS DECLARATION -------------------------//
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: UsersList.routeName,
      routes: routes,
    );
  }
}
//------------------------------- EOF -------------------------------//