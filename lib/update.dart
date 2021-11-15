// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:http_example/userDataModal.dart';
import 'package:http/http.dart' as http;

class UpdateData extends StatefulWidget {
  userDataModel store;
  UpdateData({Key? key, required this.store}) : super(key: key);

  @override
  _UpdateDataState createState() => _UpdateDataState(store);
}

class _UpdateDataState extends State<UpdateData> {
  // TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController status = TextEditingController();

  // _UpdateDataState(userDataModel store);
  userDataModel store;
  _UpdateDataState(this.store);
  String text = "";

  @override
  Widget build(BuildContext context) {
    // print(store.id);
    // print(store.name);
    // id.text = store.id;
    name.text = store.name;
    email.text = store.email;
    gender.text = store.gender;
    status.text = store.status;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit your Details'),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: name,
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
                  controller: email,
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
                  controller: gender,
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
                  controller: status,
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
                      UpdateApi();
                    },
                    child: Text(
                      "Update",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  UpdateApi() async {
    var resp = await http.patch(
        Uri.parse('https://gorest.co.in/public/v1/users/${store.id}'),
        body: {
          // "id": id.text,
          "name": name.text,
          "gender": gender.text,
          "email": email.text,
          "status": status.text,
        },
        headers: {
          "Authorization":
              "Bearer 548704c5e4646994d407f8dd1b4feeb10d403dd9e4606c5b5513191a68f1edf8"
        });
    // print("Resp -> ${resp.body}");
    print("Resp -> ${resp.statusCode}");

    if (resp.statusCode == 200) {
      print("Sahi Hai");
      Navigator.pop(context, true);
    } else {
      print("Gadbad Hai");
    }
  }
}
