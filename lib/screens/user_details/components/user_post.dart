//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';
import 'package:test_app/screens/post_details/post_details5.dart';


//------------------------ CLASS DECLARATION -------------------------//
class UserPostsWidget extends StatelessWidget {
  const UserPostsWidget({
    @required this.tappedUser, this.postsQuantity,
  });

  final  tappedUser;
  final int postsQuantity;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: postsQuantity,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, PostDetails.routeName,
            arguments: tappedUser.posts[index],
            );
          },
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 3, color: Colors.black),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              title: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title: \n ',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${tappedUser.posts[index].title}',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.blueAccent),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Body: \n ',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${tappedUser.posts[index].body}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.blueAccent),
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }
}//------------------------------- EOF -------------------------------//