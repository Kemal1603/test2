//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';
import 'package:test_app/screens/album_details/album_details.dart';
import 'package:test_app/screens/albums/user_albums_screen4.dart';
import 'package:test_app/screens/post_details/post_details5.dart';
import 'package:test_app/screens/posts/user_posts_screen3.dart';
import 'package:test_app/screens/user_details/details_screen2.dart';
import 'package:test_app/screens/users_list/users_list_screen1.dart';

/*---------------- DECLARE ALL MAP OF ROUTES ----------------*/
final Map<String, WidgetBuilder> routes = {
  UsersList.routeName: (context) => UsersList(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  PostsScreen.routeName: (context) => PostsScreen(),
  PostDetails.routeName: (context) => PostDetails(),
  AlbumsScreen.routeName: (context) => AlbumsScreen(),
  AlbumDetails.routeName: (context) => AlbumDetails(),
};
//------------------------------- EOF -------------------------------//