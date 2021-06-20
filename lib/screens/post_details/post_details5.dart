//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/add_comment.dart';
import 'components/body.dart';

//------------------------ CLASS DECLARATION -------------------------//
class PostDetails extends StatefulWidget {
  static String routeName = '/posts_details';

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  TextEditingController nameInputController,
      emailInputController,
      commentInputController;

  @override
  void initState() {
    /*--------------------- INITIALIZE ALL CONTROLLERS ---------------------*/
    nameInputController = TextEditingController();
    emailInputController = TextEditingController();
    commentInputController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic tappedPost = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      floatingActionButton: AddCommentButton(
          nameInputController: nameInputController,
          emailInputController: emailInputController,
          commentInputController: commentInputController,
          tappedPost: tappedPost),
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.screenWidth * 0.5,
              top: SizeConfig.screenHeight * 0.01),
          child: Text('Post № ${tappedPost.postId}'),
        ),
      ),
      body: Body(tappedPost: tappedPost),
    );
  }
}
//------------------------------- EOF -------------------------------//