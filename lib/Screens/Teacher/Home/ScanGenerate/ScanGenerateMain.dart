import 'package:flutter_login_purple/Screens/Teacher/Home/ScanGenerate/Screens/createqr.dart';
import 'package:flutter_login_purple/Screens/Teacher/Home/ScanGenerate/Screens/scanqr.dart';
import 'package:flutter/material.dart';

class ScanGenerate extends StatelessWidget {

  String contactKey;
  ScanGenerate({this.contactKey});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'B C R',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key,}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                print("tapped on create QR button.");
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => CreateScreen(),
                  ),
                );
              },
              child: Text("Create QR"),
            ),
          ],
        ),
      ),
    );
  }
}