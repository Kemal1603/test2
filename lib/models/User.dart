//------------------------- IMPORTED MODULES -------------------------//
import 'package:test_app/models/Album.dart';
import 'package:test_app/models/Post.dart';
//------------------------ CLASS DECLARATION -------------------------//
class User {
  final int id;
  final String name, username, email, phone, website;
  final List<Album> albums;
  final List<Post> posts;
  final Map<String, dynamic> address, company;

  User(
      {
        this.albums,
        this.posts,
        this.id,
        this.name,
        this.username,
        this.email,
        this.phone,
        this.website,
        this.address,
        this.company
      });
}

//------------------------------- EOF -------------------------------//
