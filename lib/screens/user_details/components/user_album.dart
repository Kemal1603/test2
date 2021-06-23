//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';
import 'package:test_app/screens/album_details/album_details.dart';

import '../../../size_config.dart';

//------------------------ CLASS DECLARATION -------------------------//
class UserAlbumsWidget extends StatelessWidget {
  const UserAlbumsWidget({
    @required this.tappedUser, this.index,
  });


  final  tappedUser;
  final int index;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AlbumDetails.routeName,
        arguments: tappedUser.albums[index]);
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 3, color: Colors.black),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Container(
            width: SizeConfig.screenWidth * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title: \n ',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: SizeConfig.screenHeight * 0.06,
                  child: Text(
                    '${tappedUser.albums[index].title}',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.blueAccent),
                  ),
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
                Center(
                  child: Container(
                    width: SizeConfig.screenWidth * 0.8,
                    height: SizeConfig.screenHeight * 0.18,
                    child: Image.network(
                      '${tappedUser.albums[0].photos[index]['url']}',
                      fit: BoxFit.fill,),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//------------------------------- EOF -------------------------------//