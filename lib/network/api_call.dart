//------------------------- IMPORTED MODULES -------------------------//
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_app/models/Comments.dart';

//------------------------ CLASS DECLARATION -------------------------//
class Network {
  final String url;

  Network(this.url);

  /*--------------------- GET REQUESTS ---------------------*/
  Future fetchData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.body);
    }
  }

  /*--------------------- POST REQUESTS ---------------------*/
  Future<http.Response> createPost(Comment comment) {
    return http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "postId": comment.postId,
        "id": comment.id,
        "name": comment.name,
        "email": comment.name,
        "body": comment.body
      }),
    );
  }
}

//------------------------------- EOF -------------------------------//