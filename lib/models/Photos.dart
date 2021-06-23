//------------------------ CLASS DECLARATION -------------------------//
import 'dart:convert';

class Photo {
  final int albumId, id;
  final String title, url, thumbnailUrl;


  Photo(
      {
        this.albumId,
        this.id,
        this.title,
        this.url,
        this.thumbnailUrl
      });



  /*--- CONVERTING JSON FORMAT TO STRING ---*/
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl']
    );
  }

  /*--- CONVERTING STRING TO JSON FORMAT ---*/
  static Map<String, dynamic> toJson(Map<String, dynamic> photo) => {
    'albumId': photo['albumId'],
    'id': photo['id'],
    'title': photo['title'],
    'url' : photo['url'],
    'thumbnailUrl': photo['thumbnailUrl'],
  };

  /*--- FUNCTION RETURN LIST OF JSON VALUES ---*/
  static String encode(List<dynamic> photo) => json.encode(
    photo
        .map<Map<String, dynamic>>((photo) => Photo.toJson(photo))
        .toList(),
  );

  /*--- FUNCTION RETURN LIST OF JSON VALUES ---*/
  static List<dynamic> decode(String photo) =>
      (json.decode(photo) as List<dynamic>)
          .map<dynamic>((item) => Photo.fromJson(item))
          .toList();



}
//------------------ DECLARE LIST FOR FUTURE PHOTOS ------------------//
List<dynamic> allPhotos;
//------------------------------- EOF -------------------------------//