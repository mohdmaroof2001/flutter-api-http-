// ignore_for_file: prefer_const_constructors, void_checks, dead_code

// import 'dart:html';

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class PostExam extends StatefulWidget {
  const PostExam({Key? key}) : super(key: key);

  @override
  _PostExamState createState() => _PostExamState();
}

class _PostExamState extends State<PostExam> {
  TextEditingController nameTEC = TextEditingController();
  TextEditingController emailTEC = TextEditingController();
  @override
  void initState() {
    super.initState();
    // callAddApi();
  }

  callAddApi() async {
    var resp = await http
        .post(Uri.parse('https://gorest.co.in/public/v1/users'), body: {
      "name": nameTEC.text,
      "gender": "Male",
      "email": emailTEC.text,
      "status": "active",
    }, headers: {
      "Authorization":
          "Bearer 548704c5e4646994d407f8dd1b4feeb10d403dd9e4606c5b5513191a68f1edf8"
    });
    print("Resp -> ${resp.body}");
    print("Resp -> ${resp.statusCode}");

    if (resp.statusCode == 201) {
      print("Sahi Hai");
      Navigator.pop(context, true);
    } else {
      print("Gadbad Hai");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Name',
              style: TextStyle(fontSize: 25),
            ),
            TextField(
              controller: nameTEC,
              decoration: InputDecoration(hintText: 'Enter your Name'),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Email',
              style: TextStyle(fontSize: 25),
            ),
            TextField(
              controller: emailTEC,
              decoration: InputDecoration(hintText: 'Enter your Email'),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                callAddApi();
              },
              child: Text("Submit"),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                // callAddApi();
                Navigator.pop(context);
              },
              child: Text("back"),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                // const url = 'tel:+1 555 010 999';
                luncherUrl();
              },
              child: Text("Open Email"),
            )
          ],
        ),
      ),
    );
  }

  void luncherUrl() async {
    var url = await canLaunch('https://mail.google.com')
        ? await launch('https://mail.google.com')
        : throw 'Could Not Lunch $luncherUrl()';
  }
}
