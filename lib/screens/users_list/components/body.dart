//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';
import 'package:test_app/models/User.dart';
import 'package:test_app/network/api_call.dart';
import 'package:test_app/network/request_filters.dart';
import 'package:test_app/screens/user_details/details_screen2.dart';

//------------------------ CLASS DECLARATION -------------------------//
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    /*--- CALL ASYNC FUNCTION TO TO START DOWNLOAD DATA  ONCE PAGE LOADED---*/
    Filters.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future:
              Network('https://jsonplaceholder.typicode.com/users').fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            DetailsScreen.routeName,
                            arguments: User(
                                id: snapshot.data[index]['id'],
                                name: snapshot.data[index]['name'],
                                username: snapshot.data[index]['username'],
                                email: snapshot.data[index]['email'],
                                address: snapshot.data[index]['address'],
                                phone: snapshot.data[index]['phone'],
                                website: snapshot.data[index]['website'],
                                company: snapshot.data[index]['company'],
                                posts: Filters.filteredPosts(
                                    snapshot.data[index]['id']),
                                albums: Filters.filteredAlbums(
                                     snapshot.data[index]['id'])),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.black.withOpacity(0.2),
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                            title: Center(
                                child: Column(
                              children: [
                                Text('${snapshot.data[index]['username']}'),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text('${snapshot.data[index]['name']}'),
                              ],
                            )),
                          ),
                        ),
                      ),
                    );
                  });
            }
            /* return Center(
              child: CircularProgressIndicator(),
            );*/
            return Center(
              child: Text(
                'Huy tam plaval',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            );
          }),
    );
  }
}
//------------------------------- EOF -------------------------------//