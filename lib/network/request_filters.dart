//------------------------- IMPORTED MODULES -------------------------//
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/models/Album.dart';
import 'package:test_app/models/Comments.dart';
import 'package:test_app/models/Photos.dart';
import 'package:test_app/models/Post.dart';

import 'api_call.dart';

//------------------------ CLASS DECLARATION -------------------------//
class Filters {
  /*------------ GET ALL DATA FROM JSONPLACEHOLDER.COM ------------*/
  static void getData() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString('allComments') != null &&
        prefs.getString('allPosts') != null &&
        prefs.getString('allAlbums') != null &&
        prefs.getString('allPhotos') != null) {

      allComments = Comment.decode(prefs.getString('allComments'));
      allPosts = Post.decode(prefs.getString('allPosts'));
      allPhotos = Photo.decode(prefs.getString('allPhotos'));
      allAlbums = Album.decode(prefs.getString('allAlbums'));

    } else {
      await Network('https://jsonplaceholder.typicode.com/comments')
          .fetchData()
          .then((commentsFromApi) {
        final String encodedComments = Comment.encode(commentsFromApi);
        prefs.setString('allComments', encodedComments);
      });

      await Network('https://jsonplaceholder.typicode.com/posts')
          .fetchData()
          .then((postsFromApi) {
        final String encodedPosts = Post.encode(postsFromApi);
        prefs.setString('allPosts', encodedPosts);
      });

      await Network('https://jsonplaceholder.typicode.com/albums')
          .fetchData()
          .then((albumsFromApi) {
        allAlbums = albumsFromApi;
        final String encodedAlbums = Album.encode(albumsFromApi);
        prefs.setString('allAlbums', encodedAlbums);
      });

      await Network('https://jsonplaceholder.typicode.com/photos')
          .fetchData()
          .then((photosFromApi) {
        final String encodedPhotos = Photo.encode(photosFromApi);
        prefs.setString('allPhotos', encodedPhotos);
      });

      allComments = Comment.decode(prefs.getString('allComments'));
      allPosts = Post.decode(prefs.getString('allPosts'));
      allPhotos = Photo.decode(prefs.getString('allPhotos'));
      allAlbums = Album.decode(prefs.getString('allAlbums'));
    }
  }

  /*-------- RETURN LIST OF COMMENTS TO SPECIFIC POST --------*/
  static List<dynamic> filteredComments(int postId) {
    List<dynamic> currentPostComments = [];
    if (allComments != null) {
      for (var comment in allComments) {
        if (comment.postId == postId) {
          currentPostComments.add({
            'postId': comment.postId,
            'id': comment.id,
            'body': comment.body,
            'name': comment.name,
            'email': comment.email,
          });
        }
      }
    }
    return currentPostComments;
  }

  /*------------ RETURN LIST OF POSTS BELONG TO PROVIDED USER ------------*/
  static List<dynamic> filteredPosts(int userId) {
    List<dynamic> currentUserPosts = [];
    if (allPosts != null) {

      for (dynamic post in allPosts) {
        if ( post.userId == userId) {
          currentUserPosts.add(
            Post(
              userId: post.userId,
              id: post.id,
              title: post.title,
              body: post.body,
              comments: filteredComments(post.id),
            ),
          );
        }
      }
    }
    return currentUserPosts;
  }

  /*-------- RETURN LIST OF PHOTOS BELONG SPECIFIC ALBUM --------*/
  static List<dynamic> filteredPhotos(int albumId) {
    List<dynamic> currentUserPhotos = [];
    if (allPhotos != null) {
      for (var photo in allPhotos) {
        if (photo.albumId == albumId) {
          currentUserPhotos.add({
            'albumId': photo.albumId,
            'title': photo.title,
            'id': photo.id,
            'url': photo.url,
            'thumbnailUrl': photo.thumbnailUrl
          });
        }
      }
    }
    return currentUserPhotos;
  }

  /*------------ RETURN LIST OF ALBUMS BELONG TO PROVIDED USER ------------*/
  static List<dynamic> filteredAlbums(int userId) {
    List<dynamic> currentUserAlbums = [];
    if (allAlbums != null) {
      for (var album in allAlbums) {
        if (album.userId == userId) {
          currentUserAlbums.add(
            Album(
                userId: album.userId,
                id: album.id,
                title: album.title,
                photos: filteredPhotos(album.id)),
          );
        }
      }
    }
    return currentUserAlbums;
  }
}
//------------------------------- EOF -------------------------------//
