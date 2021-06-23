//------------------------- IMPORTED MODULES -------------------------//
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_app/models/Comments.dart';
import 'package:test_app/network/api_call.dart';

//------------------------ CLASS DECLARATION -------------------------//
class AddCommentButton extends StatelessWidget {
  const AddCommentButton({
    @required this.nameInputController,
    @required this.emailInputController,
    @required this.commentInputController,
    @required this.tappedPost,
  });

  /*--------------------- DECLARE ALL CONTROLLERS ---------------------*/
  final TextEditingController nameInputController;
  final TextEditingController emailInputController;
  final TextEditingController commentInputController;
  final  tappedPost;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.lightBlue,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                contentPadding: EdgeInsets.all(10),
                content: Column(
                  children: [
                    Text(
                      'Please Fill out the form to add your Comment',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        autocorrect: true,
                        decoration: InputDecoration(
                          labelText: 'Your Name',
                        ),
                        controller: nameInputController,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        autocorrect: true,
                        decoration: InputDecoration(
                          labelText: 'Your Email',
                        ),
                        controller: emailInputController,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        autocorrect: true,
                        decoration: InputDecoration(
                          labelText: 'Your Comment',
                        ),
                        controller: commentInputController,
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    /*--- CHECK ALL FILLED AND SEND POST REQUEST ---*/
                    onPressed: () {
                      if (nameInputController.text.isNotEmpty &&
                          emailInputController.text.isNotEmpty &&
                          commentInputController.text.isNotEmpty) {
                        Network(
                            'https://jsonplaceholder.typicode.com/comments').createPost(Comment(
                          id: Random().nextInt(100),
                          postId: tappedPost.id,
                          name: nameInputController.text,
                          email: emailInputController.text,
                          body: commentInputController.text,
                        ));
                        /*tappedPost.comments.add(
                            {
                              'postId': tappedPost.postId,
                              'id': Random().nextInt(100),
                              'body': commentInputController.text,
                              'name': nameInputController.text,
                              'email': emailInputController.text,
                            });*/

                        Navigator.pop(context);
                      }
                    },
                    child: Text('Send'),
                  )
                ],
              ),
        );
      },
      child: Icon(Icons.add),
    );
  }
}
//------------------------------- EOF -------------------------------//