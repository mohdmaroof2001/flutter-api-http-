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
  TextEditingController genderTEC = TextEditingController();
  TextEditingController statusTEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    // callAddApi();
  }

  callAddApi() async {
    var resp = await http
        .post(Uri.parse('https://gorest.co.in/public/v1/users'), body: {
      "name": nameTEC.text,
      "gender": genderTEC.text,
      "email": emailTEC.text,
      "status": statusTEC.text,
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
      appBar: AppBar(
        title: Text("Add your Details"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: nameTEC,
                  decoration: InputDecoration(
                      hintText: 'Name',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange))),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: emailTEC,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange))),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: genderTEC,
                  decoration: InputDecoration(
                      hintText: 'Gender',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange))),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: statusTEC,
                  decoration: InputDecoration(
                      hintText: 'Active / Inactive',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange))),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      height: 45,
                      child: MaterialButton(
                        elevation: 15,
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        onPressed: () {
                          callAddApi();
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 150,
                      height: 45,
                      child: MaterialButton(
                        elevation: 15,
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        onPressed: () {
                          luncherUrl();
                        },
                        child: Text(
                          "Email",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: 350,
                  height: 45,
                  child: MaterialButton(
                    elevation: 15,
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void luncherUrl() async {
    var url = await canLaunch('mailto:')
        ? await launch('mailto:')
        : throw 'Could Not Lunch $luncherUrl()';
  }
}
