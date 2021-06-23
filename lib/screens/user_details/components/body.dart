//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';
import 'package:test_app/screens/albums/user_albums_screen4.dart';
import 'package:test_app/screens/posts/user_posts_screen3.dart';
import 'package:test_app/screens/user_details/components/user_album.dart';
import 'package:test_app/screens/user_details/components/user_post.dart';

import '../../../size_config.dart';
import 'all_items.dart';
import 'catch_phrase.dart';
import 'details_text.dart';

//------------------------ CLASS DECLARATION -------------------------//
class Body extends StatelessWidget {
  const Body({
    @required this.tappedUser,
  });

  final tappedUser;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.3,
            width: SizeConfig.screenWidth,
            child:  Image.network(
              '${tappedUser.albums[0].photos[0]['url']}',
              fit: BoxFit.fill,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              border: Border(
                bottom: BorderSide(width: 2.0, color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.02,
          ),
          /*--------------------- USER DATA ---------------------*/
          DetailsTextWidget(text: 'Name', field: tappedUser.name),
          DetailsTextWidget(text: 'Email', field: tappedUser.email),
          DetailsTextWidget(text: 'Phone', field: tappedUser.phone),
          DetailsTextWidget(text: 'Website', field: tappedUser.website),
          DetailsTextWidget(text: 'Company', field: tappedUser.company['name']),
          DetailsTextWidget(text: 'bs', field: tappedUser.company['bs']),
          CatchPhraseWidget(tappedUser: tappedUser),
          DetailsTextWidget(
              text: 'Address',
              field: '${tappedUser.address['city']},'
                  ' ${tappedUser.address['street']},'
                  ' ${tappedUser.address['suite']}, '
                  '${tappedUser.address['zipcode']}'),
          Divider(
            color: Colors.black,
            thickness: 2.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, left: 20.0),
            child: Text(
              'Posts: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          Container(
            height: SizeConfig.screenHeight * 0.4,
            child: UserPostsWidget(tappedUser: tappedUser, postsQuantity: 3),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          AllItems(
            tappedUser: tappedUser,
            press: () {
              Navigator.pushNamed(
                context,
                PostsScreen.routeName,
                arguments: tappedUser,
              );
            },
            text: 'All Posts',
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          Divider(
            color: Colors.black,
            thickness: 2.0,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, left: 20.0),
            child: Text(
              'Albums: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          Container(
            height: SizeConfig.screenHeight * 0.4,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) =>
                    UserAlbumsWidget(tappedUser: tappedUser, index: index)),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          AllItems(
            tappedUser: tappedUser,
            press: () {
              Navigator.pushNamed(
                context,
                AlbumsScreen.routeName,
                arguments: tappedUser,
              );
            },
            text: 'All Albums',
          )
        ],
      ),
    );
  }
}


//------------------------------- EOF -------------------------------//