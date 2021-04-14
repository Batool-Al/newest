import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_purple/Screens/Admin/Courses/AddCourses.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../components/rounded_input_field.dart';
import 'package:flutter_login_purple/Screens/Admin/Courses/DisplayCourses.dart';


class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();

  const AdminHomePage({Key key, }) : super(key: key);

}

class _AdminHomePageState extends State<AdminHomePage> {


  @override
  Widget build(BuildContext context) =>
      DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("hello"),
            //centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
            //backgroundColor: Colors.purple,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo[400], Colors.indigo[500]],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            bottom: TabBar(
              //isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [

                Tab(icon: Icon(Icons.group_add_outlined), text: 'Teachers'),
                Tab(icon: Icon(Icons.menu_book_outlined), text:  'Courses'),
                Tab(icon: Icon(Icons.message_outlined), text: 'Excuses'),
                Tab(icon: Icon(Icons.face), text: 'Profile'),

              ],
            ),
            elevation: 20,
            titleSpacing: 20,
          ),
          body: TabBarView(
            children: [
              buildPage("Hello"),
              buildPage2(
                  Scaffold(
                    floatingActionButton: FloatingActionButton(
                      onPressed:  () {
                        Navigator.push(context,
                            MaterialPageRoute(builder:
                                (context) => AddCourses())
                        );
                      },
                      tooltip: 'Increment',
                      child: Icon(Icons.add),
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      shape: BeveledRectangleBorder (borderRadius: BorderRadius.all(Radius.circular(18.0))),
                    ),
                    body: Courses(),
                  )
              ),
              buildPage3(
                Column(
                    children: [
                      Container(
                        child: Text("hello"),
                      ),

                    ]
                ),),
              buildPage4('Settings Page'),
            ],
          ),
        ),
      );

  Widget buildPage(String text) =>
      Column(
        children: [
          Container(
            child: Text(text),
          ),
          Container(
            color: Colors.pink,
            margin: EdgeInsets.all(20),
          )
        ],
      );
  Widget buildPage2(Scaffold scaffold) =>
      Scaffold(
        body: scaffold,
      );
  Widget buildPage3(Column container) =>
      Column(
        children: [
          container,
        ],
      );
  Widget buildPage4(String text) =>
      Column(
        children: [
          Container(
            child: Text(text = "hello there"),
          ),
          Container(
            color: Colors.pink,
            margin: EdgeInsets.all(20),
          )
        ],
      );
}

