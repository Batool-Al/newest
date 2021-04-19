
import 'package:flutter/material.dart';

import 'package:flutter_login_purple/Screens/Student/Home/page/attendance_page.dart';
import 'package:flutter_login_purple/Screens/Student/Home/page/Profile_page.dart';
import 'package:flutter_login_purple/Screens/Student/Home/page/course_page.dart';
import 'package:flutter_login_purple/Screens/Student/Home/page/excuses_page.dart';
import 'package:flutter_login_purple/Screens/Student/Home/widget/tabbar_material_widget.dart';


class StudentHomePage extends StatefulWidget {

  final String title;
  final String contactKey;

  const StudentHomePage({
    @required this.title, this.contactKey,
  });

  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  int index = 0;
  @override
  Widget build (BuildContext context){

    final pages = <Widget>[

      StudentScan(studentuid: widget.contactKey),
      CoursesPage(),
      ExcusesPage(),
      ProfilePage(),

    ];
    return Scaffold(
      extendBody: true,
      body: pages[index],
      bottomNavigationBar: TabBarMaterialWidget(
        index: index,
        onChangedTab: onChangedTab,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt_outlined),
        onPressed: () {
          print("lsaklkdslkdlskl ${widget.contactKey}");
      },
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  );}

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
