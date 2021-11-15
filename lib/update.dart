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
  TextEditingController id = TextEditingController();
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
    id.text = store.id;
    name.text = store.name;
    email.text = store.email;
    gender.text = store.gender;
    status.text = store.status;

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: id,
              decoration: InputDecoration(hintText: "Id"),
            ),

            // ignore: prefer_const_constructors
            TextField(
              controller: name,
              decoration: InputDecoration(hintText: "Name"),
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: "Email"),
            ),
            TextField(
              controller: gender,
              decoration: InputDecoration(hintText: "Gender"),
            ),
            TextField(
              controller: status,
              decoration: InputDecoration(hintText: "Status"),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  UpdateApi();
                  Navigator.pop(context, true);
                },
                child: Text("Update")),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back")),
          ],
        ),
      ),
    );
  }

  UpdateApi() async {
    var resp = await http
        .patch(Uri.parse('https://gorest.co.in/public/v1/users'), body: {
      "id": id.text,
      "name": name.text,
      "gender": gender.text,
      "email": email.text,
      "status": status.text,
    }, headers: {
      "Authorization":
          "Bearer 548704c5e4646994d407f8dd1b4feeb10d403dd9e4606c5b5513191a68f1edf8"
    });
    // print("Resp -> ${resp.body}");
    print("Resp -> ${resp.statusCode}");

    if (resp.statusCode == 201) {
      print("Sahi Hai");
      Navigator.pop(context, true);
    } else {
      print("Gadbad Hai");
    }
  }
}
