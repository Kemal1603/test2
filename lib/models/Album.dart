//------------------------- IMPORTED MODULES -------------------------//
import 'Photos.dart';
//------------------------ CLASS DECLARATION -------------------------//
class Album {
  final int userId, albumId;
  final String title;
  final List<Photo> photos;

  Album(
      {
        this.userId,
        this.albumId,
        this.title,
        this.photos,
      });

}

//------------------ DECLARE LIST FOR FUTURE ALBUMS ------------------//

List<dynamic> allAlbums;
//------------------------------- EOF -------------------------------//
