// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String respStr = "";

  @override
  void initState() {
    super.initState();
    apicall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Text(
              respStr,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  apicall() async {
    var resp = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );
    print("Api call done ${resp.body}");
    setState(() {
      respStr = resp.body;
    });
  }
}
