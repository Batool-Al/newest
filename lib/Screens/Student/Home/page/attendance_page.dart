
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class StudentScan extends StatefulWidget {
  final String studentuid;

  const StudentScan({Key key, this.studentuid}) : super(key: key);
  @override
  _StudentScanState createState() => _StudentScanState();

}

class _StudentScanState extends State<StudentScan> {
  String student;
  double height, width;
  String qrString = "Not Scanned";

  @override
  Widget build(BuildContext context) {
    student = widget.studentuid;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    print("hello jjh ${widget.studentuid}");
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.studentuid}"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            qrString,
            style: TextStyle(color: Colors.blue, fontSize: 30),
          ),
          ElevatedButton(
            onPressed: scanQR,
            child: Text("Scan QR Code1"),
          ),
          SizedBox(width: width),
        ],
      ),
    );
  }

  Future <void> scanQR() async {

    try {

      FlutterBarcodeScanner.scanBarcode("#2A99CF", "Cancel", true, ScanMode.QR)
          .then((value) {
        setState(() {
          FirebaseDatabase.instance.reference().child('Courses').child(value).push().set({

            widget.studentuid: widget.studentuid,

          });
        });
      });
      qrString = widget.studentuid;
    } catch (e) {
      setState(() {
        qrString = "unable to read the qr";
      });
    }

  }
}