//------------------------ CLASS DECLARATION -------------------------//
import 'dart:convert';

class Comment {
  final int postId, id;
  final String name, email, body;

  Comment(
      {
        this.postId,
        this.id,
        this.name,
        this.email,
        this.body
      });


  /*--- CONVERTING JSON FORMAT TO STRING ---*/
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
       postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }

  /*--- CONVERTING STRING TO JSON FORMAT ---*/
  static Map<String, dynamic> toJson(Map<String, dynamic> comment) => {
    'postId' : comment['postId'],
    'id': comment['id'],
    'name': comment['name'],
    'email': comment['email'],
    'body' : comment['body'],
  };

  /*--- FUNCTION RETURN LIST OF JSON VALUES ---*/
  static String encode(List<dynamic> comment) => json.encode(
    comment
        .map<Map<String, dynamic>>((comment) => Comment.toJson(comment))
        .toList(),
  );

  /*--- FUNCTION RETURN LIST OF JSON VALUES ---*/
  static List<dynamic> decode(String comment) =>
      (json.decode(comment) as List<dynamic>)
          .map<dynamic>((item) => Comment.fromJson(item))
          .toList();


}


//---------------- DECLARE LIST FOR FUTURE COMMENTS ----------------//
List<dynamic> allComments;
//------------------------------- EOF -----------------------------//