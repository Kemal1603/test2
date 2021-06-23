//------------------------- IMPORTED MODULES -------------------------//
import 'dart:convert';

//------------------------ CLASS DECLARATION -------------------------//
class User {
  final int id;
  final String name, username, email, phone, website;
  final List<dynamic> albums;
  final List<dynamic> posts;
  final Map<String, dynamic> address, company;

  User(
      {this.albums,
      this.posts,
      this.id,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.website,
      this.address,
      this.company});
  /*--- CONVERTING JSON FORMAT TO STRING ---*/
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        id: json['id'],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        website: json['website'],
        address: json['address'],
        company: json['company'],
        albums: json['albums'],
        posts: json['posts']);
  }

  /*--- CONVERTING STRING TO JSON FORMAT ---*/
  static Map<String, dynamic> toJson(User user) => {
        'id': user.id,
        'name': user.name,
        'username': user.username,
        'email': user.email,
        'phone': user.phone,
        'website': user.website,
        'address': user.address,
        'company': user.company,
        'albums': user.albums,
        'posts': user.posts
      };

  /*--- FUNCTION RETURN LIST OF JSON VALUES ---*/
  static String encode(List<dynamic> user) => json.encode(
        user.map<Map<String, dynamic>>((user) => User.toJson(user)).toList(),
      );

  /*--- FUNCTION RETURN LIST OF JSON VALUES ---*/
  static List<dynamic> decode(String user) =>
      (json.decode(user) as List<dynamic>)
          .map<dynamic>((item) => User.fromJson(item))
          .toList();
}


//------------------------------- EOF -------------------------------//
