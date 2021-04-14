
import 'package:flutter/material.dart';
import 'package:flutter_login_purple/Screens/Student/Home/page/attendance_page.dart';
import 'package:flutter_login_purple/Screens/Student/Home/page/Profile_page.dart';
import 'package:flutter_login_purple/Screens/Student/Home/page/course_page.dart';
import 'package:flutter_login_purple/Screens/Student/Home/page/excuses_page.dart';
import 'package:flutter_login_purple/Screens/Student/Home/widget/tabbar_material_widget.dart';


class StudentHomePage extends StatefulWidget {
  final String title;

  const StudentHomePage({
    @required this.title,
  });

  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  int index = 0;

  final pages = <Widget>[
    AttendancePage(),
    CoursesPage(),
    ExcusesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    extendBody: true,
    body: pages[index],
    bottomNavigationBar: TabBarMaterialWidget(
      index: index,
      onChangedTab: onChangedTab,
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.camera_alt_outlined),
      onPressed: () => print('Hello World'),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  );

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
