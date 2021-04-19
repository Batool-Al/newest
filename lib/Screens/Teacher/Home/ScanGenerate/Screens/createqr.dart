import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class CreateScreen extends StatefulWidget {
  String contactKey;
  CreateScreen({this.contactKey});
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  TextEditingController _courseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String qrString = widget.contactKey;
    return Scaffold(
      appBar: AppBar(
        title: Text("Create QR Code ${widget.contactKey}", style: TextStyle(fontSize: 12),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // qr code
          BarcodeWidget(
            color: Colors.blue,
            data: qrString,
            height: 250,
            width: 250,
            barcode: Barcode.qrCode(),
          ),
          // link
          Container(
            width: MediaQuery.of(context).size.width * .8,
            child: TextFormField(
              controller: _courseController,
              onChanged: (val) {
                setState(() {
                  qrString = val;
                });
              },
              decoration: InputDecoration(
                hintText: "Enter Course",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: (){
                saveContact();
              },
              child: Text("Save Course")),
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
  void saveContact(){
    Map<String,String> contact = {
      'Course': _courseController.text,
    };
    FirebaseFirestore.instance.collection('Courses').add(contact);}
}