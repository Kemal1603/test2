//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';

import '../../../size_config.dart';

//------------------------ CLASS DECLARATION -------------------------//
class Body extends StatelessWidget {
  const Body({
    @required this.tappedPost,
  });

  final  tappedPost;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    '${tappedPost.title}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 27.0),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.05,
                  ),
                  Text(
                    '${tappedPost.body}',
                    style: TextStyle(
                        fontSize: 20.0, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.05,
                  ),
                  Text(
                    'Comments: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 27.0),
                  ),
                  Container(
                    height: SizeConfig.screenHeight * 0.46,
                    child: ListView.builder(
                      itemCount: tappedPost.comments.length,
                      itemBuilder: (context, index) =>
                          Card(
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: 'Name: ',
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                            style: TextStyle(
                                                fontWeight: FontWeight
                                                    .normal),
                                            text:
                                            '${tappedPost.comments[index]['name']}\n',
                                            children: [
                                              TextSpan(
                                                  text: 'Email: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold),
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                      '${tappedPost.comments[index]['email']}\n',
                                                      style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.normal,
                                                        color: Colors
                                                            .lightBlue,
                                                      ),
                                                    ),
                                                  ]),
                                            ]),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Comment: \n',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('${tappedPost.comments[index]['body']}\n')
                                ],
                              ),
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//------------------------------- EOF -------------------------------//