//------------------------- IMPORTED MODULES -------------------------//
import 'dart:convert';

import 'package:test_app/network/request_filters.dart';

//------------------------ CLASS DECLARATION -------------------------//
class Post {
  final int userId, id;
  final String title, body;
  final List<dynamic> comments;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
    this.comments,
  });

  /*--- CONVERTING JSON FORMAT TO STRING ---*/
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
      comments: Filters.filteredComments(json['id']),
    );
  }

  /*--- CONVERTING STRING TO JSON FORMAT ---*/
  static Map<String, dynamic> toJson(Map<String, dynamic> post) => {
        'userId': post['userId'],
        'id': post['id'],
        'title': post['title'],
        'body': post['body'],
        'comments': Filters.filteredComments(post['id']),
      };

  /*--- FUNCTION RETURN LIST OF JSON VALUES ---*/
  static String encode(List<dynamic> post) => json.encode(
        post.map<Map<String, dynamic>>((post) => Post.toJson(post)).toList(),
      );

  /*--- FUNCTION RETURN LIST OF JSON VALUES ---*/
  static List<dynamic> decode(String post) =>
      (json.decode(post) as List<dynamic>)
          .map<dynamic>((item) => Post.fromJson(item))
          .toList();
}

//------------------ DECLARE LIST FOR FUTURE POSTS ------------------//
List<dynamic> allPosts;
//------------------------------- EOF -------------------------------//
