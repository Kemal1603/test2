//------------------------- IMPORTED MODULES -------------------------//
import 'dart:convert';

import 'package:test_app/network/request_filters.dart';
//------------------------ CLASS DECLARATION -------------------------//
class Album {
  final int userId, id;
  final String title;
  final List<dynamic> photos;

  Album(
      {
        this.userId,
        this.id,
        this.title,
        this.photos,
      });

  /*--- CONVERTING JSON FORMAT TO STRING ---*/
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      photos: Filters.filteredPhotos(json['id'])
    );
  }

  /*--- CONVERTING STRING TO JSON FORMAT ---*/
  static Map<String, dynamic> toJson(Map<String, dynamic> album) => {
    'userId' : album['userId'],
    'id' : album['id'],
    'title' : album['title'],
    'photos' : Filters.filteredPhotos(album['id']),
  };

  /*--- FUNCTION RETURN LIST OF JSON VALUES ---*/
  static String encode(List<dynamic> album) => json.encode(
    album.map<Map<String, dynamic>>((album) => Album.toJson(album)).toList(),
  );

  /*--- FUNCTION RETURN LIST OF JSON VALUES ---*/
  static List<dynamic> decode(String user) =>
      (json.decode(user) as List<dynamic>)
          .map<dynamic>((item) => Album.fromJson(item))
          .toList();



}

//------------------ DECLARE LIST FOR FUTURE ALBUMS ------------------//

List<dynamic> allAlbums;
//------------------------------- EOF -------------------------------//
