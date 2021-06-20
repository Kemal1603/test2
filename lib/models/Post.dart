//------------------------- IMPORTED MODULES -------------------------//
import 'Comments.dart';
//------------------------ CLASS DECLARATION -------------------------//
class Post {
  final int userId, postId;
  final String title, body;
  final List<Comment> comments;

  Post(
      {
        this.userId,
        this.postId,
        this.title,
        this.body,
        this.comments,
      });
}
//------------------ DECLARE LIST FOR FUTURE POSTS ------------------//
List<dynamic> allPosts;
//------------------------------- EOF -------------------------------//