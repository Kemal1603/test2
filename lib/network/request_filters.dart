//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';
import 'package:test_app/models/Album.dart';
import 'package:test_app/models/Comments.dart';
import 'package:test_app/models/Photos.dart';
import 'package:test_app/models/Post.dart';

import 'api_call.dart';

//------------------------ CLASS DECLARATION -------------------------//
class Filters {

  /*------------ GET ALL DATA FROM JSONPLACEHOLDER.COM ------------*/
  static void getData() async {

    await Network('https://jsonplaceholder.typicode.com/comments')
        .fetchData()
        .then((commentsFromApi) => allComments = commentsFromApi);
    await Network('https://jsonplaceholder.typicode.com/posts')
        .fetchData()
        .then((postsFromApi) => allPosts = postsFromApi);
    await Network('https://jsonplaceholder.typicode.com/albums')
        .fetchData()
        .then((albumsFromApi) => allAlbums = albumsFromApi);
    await Network('https://jsonplaceholder.typicode.com/photos')
        .fetchData()
        .then((photosFromApi) => allPhotos = photosFromApi);
  }

  /*-------- RETURN LIST OF COMMENTS TO SPECIFIC POST --------*/
  static List<Comment> filteredComments(int postId) {
    List<Comment> currentPostComments = [];
    if (allComments != null) {
      for (var comment in allComments) {
        if (comment['postId'] == postId) {
          currentPostComments.add(Comment(
            postId: comment['postId'],
            id: comment['id'],
            body: comment['body'],
            name: comment['name'],
            email: comment['email'],
          ));
        }
      }
    }
    return currentPostComments;
  }

  /*------------ RETURN LIST OF POSTS BELONG TO PROVIDED USER ------------*/
  static List<Post> filteredPosts(AsyncSnapshot<dynamic> snapshot, int index) {
    List<Post> currentUserPosts = [];
    if (allPosts != null) {
      for (var post in allPosts) {
        if (post['userId'] == index) {
          currentUserPosts.add(
            Post(
              userId: post['userId'],
              postId: post['id'],
              title: post['title'],
              body: post['body'],
              comments: filteredComments(post['id']),
            ),
          );
        }
      }
    }
    return currentUserPosts;
  }

  /*-------- RETURN LIST OF PHOTOS BELONG SPECIFIC ALBUM --------*/
  static List<Photo> filteredPhotos(int albumId) {
    List<Photo> currentUserPhotos = [];
    if (allPhotos != null) {
      for (var photo in allPhotos) {
        if (photo['albumId'] == albumId) {
          currentUserPhotos.add(Photo(
              albumId: photo['albumId'],
              title: photo['title'],
              id: photo['id'],
              url: photo['url'],
              thumbnailUrl: photo['thumbnailUrl']));
        }
      }
    }
    return currentUserPhotos;
  }

  /*------------ RETURN LIST OF ALBUMS BELONG TO PROVIDED USER ------------*/
  static List<Album> filteredAlbums(
      AsyncSnapshot<dynamic> snapshot, int index) {
    List<Album> currentUserAlbums = [];
    if (allAlbums != null) {
      for (var album in allAlbums) {
        if (album['userId'] == snapshot.data[index]['id']) {
          currentUserAlbums.add(
            Album(
                userId: album['userId'],
                albumId: album['id'],
                title: album['title'],
                photos: filteredPhotos(album['id'])),
          );
        }
      }
    }
    return currentUserAlbums;
  }
}
//------------------------------- EOF -------------------------------//