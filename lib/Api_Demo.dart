// ignore_for_file: file_names, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_example/post.dart';
import 'package:http_example/update.dart';
import 'package:http_example/userDataModal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var count = 0;
  var arr = [];

  @override
  void initState() {
    super.initState();
    apiCall();
    // secondapiCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemBuilder: (context, indexNo) {
              var userData = arr[indexNo];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    userDataModel data = userDataModel(
                        userData['id'].toString(),
                        userData['name'],
                        userData['email'],
                        userData['gender'],
                        userData['status']);
                    return UpdateData(
                      store: data,
                    );
                  }));
                },
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    IconButton(
                        onPressed: () {
                          deleteApi();
                          apiCall();
                        },
                        icon: Icon(
                          Icons.delete,
                          size: 30,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Id: ${userData['id'].toString()}',
                          style: TextStyle(
                            fontSize: 16,
                            // color: Colors.w,
                          ),
                        ),
                        // Text(
                        //   userData['post_id'].toString(),
                        //   style: TextStyle(fontSize: 18),
                        // ),
                        Text(
                          'Name: ${userData['name']}',
                          style: TextStyle(
                            fontSize: 16,
                            // color: Colors.white,
                          ),
                        ),
                        Text(
                          'Email: ${userData['email']}',
                          style: TextStyle(
                            fontSize: 16,
                            // color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "gender: ${userData["gender"]}",
                              style: TextStyle(fontSize: 16),
                            ),
                            userData["gender"] == "male"
                                ? Icon(Icons.male)
                                : Icon(Icons.female)
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Status: ${userData['status']}',
                              style: TextStyle(
                                fontSize: 16,
                                // color: Colors.white,
                              ),
                            ),
                            //teermaeri
                            userData["status"] == "active"
                                ? Container(
                                    width: 10,
                                    height: 20,
                                    color: Colors.green,
                                  )
                                : Container(
                                    width: 10,
                                    height: 20,
                                    color: Colors.red,
                                  )
                          ],
                        ),

                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: arr.length,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(Icons.add),
          onPressed: () async {
            var result = await Navigator.push(
                context, MaterialPageRoute(builder: (context) => PostExam()));
            print("Result id $result");
            if (result == true) {
              print("Firse Api Call");
              apiCall();
            }
            //  if (result == Sahi) {
            //   print("Firse Api Call");
            //   apiCall();
            // }
          }),
    );
  }

  apiCall() async {
    print('apiCall');
    var recp = await http.get(
      Uri.parse('https://gorest.co.in/public/v1/users?email=kayam'),
    );
    var jsonResp = jsonDecode(recp.body);
    // print('api complete $jsonResp');
    setState(() {
      arr = jsonResp['data'];
    });
  }

  secondapiCall() async {
    var recp =
        await http.get(Uri.parse('https://gorest.co.in/public/v1/comments'));
    var jsonObj = jsonDecode(recp.body);
    setState(() {
      arr = jsonObj['data'];
    });
  }

  deleteApi() async {
    var responce = await http.delete(
        Uri.parse('https://gorest.co.in/public/v1/user/3315'),
        headers: {
          "Authorization":
              "Bearer 548704c5e4646994d407f8dd1b4feeb10d403dd9e4606c5b5513191a68f1edf8"
        });
    // print("Resp -> ${responce.body}");
    print("Resp -> ${responce.statusCode}");
    if (responce.statusCode == 204) {
      print("Sahi Hai");
      // Navigator.pop(context, true);
    } else {
      print("Gadbad Hai");
    }
  }
}
