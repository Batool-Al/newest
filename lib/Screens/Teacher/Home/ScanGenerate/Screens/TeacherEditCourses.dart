import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TeacherEditCourses extends StatefulWidget {
  String contactKey;
  TeacherEditCourses({this.contactKey});

  @override
  _TeacherEditCoursesState createState() => _TeacherEditCoursesState();
}

class _TeacherEditCoursesState extends State<TeacherEditCourses> {
  TextEditingController _courseController, _majorController;
  String _typeSelected = '';

  DatabaseReference _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _courseController = TextEditingController();
    _majorController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Courses');
    getCourseDetail();
  }

  Widget _buildContactType(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: _typeSelected == title
              ? Colors.green
              : Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _typeSelected = title;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Course'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _courseController,
              decoration: InputDecoration(
                hintText: 'Enter Course',
                prefixIcon: Icon(
                  Icons.code,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _majorController,
              decoration: InputDecoration(
                hintText: 'Enter Major',
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(
              height: 15,
            ),

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: RaisedButton(
                child: Text(
                  'Update Course',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  saveContact();
                },
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  getCourseDetail() async {
    DataSnapshot snapshot = await _ref.child(widget.contactKey).once();

    Map contact = snapshot.value;

    _courseController.text = contact["Course"];

    _majorController.text = contact["Major"];

  }

  void saveContact() {
    String name = _courseController.text;
    String number = _majorController.text;

    Map<String, String> contact = {
      'Course': name,
      'Major':  number,
    };

    _ref.child(widget.contactKey).update(contact).then((_) {
      Navigator.pop(context);
    }).asStream();

  }

}