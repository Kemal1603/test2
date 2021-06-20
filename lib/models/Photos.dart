//------------------------ CLASS DECLARATION -------------------------//
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
      }
      );
}
//------------------ DECLARE LIST FOR FUTURE PHOTOS ------------------//
List<dynamic> allPhotos;
//------------------------------- EOF -------------------------------//