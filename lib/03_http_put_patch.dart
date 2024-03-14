import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HTTP_put_patch extends StatefulWidget {
  const HTTP_put_patch({Key? key}) : super(key: key);

  @override
  _HTTP_put_patchState createState() => _HTTP_put_patchState();
}

class _HTTP_put_patchState extends State<HTTP_put_patch> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();

  String hasilResponse = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP PUT / PATCH"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
          SizedBox(height: 15),
          TextField(
            controller: jobC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Job",
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () async {
              var myresponse = await http.put(
                //ganti aja nih putch samapatch nya
                Uri.parse("https://reqres.in/api/users/3"),
                body: {"name": nameC.text, "job": jobC.text},
              );

              Map<String, dynamic> data =
                  json.decode(myresponse.body) as Map<String, dynamic>;
//myresponse.body => bentuknya string terus diubah jadi Map dengan json decode
              setState(() {
                hasilResponse = "${data['name']} - ${data['job']}";
              });
            },
            child: Text("SUBMIT"),
          ),
          SizedBox(height: 50),
          Divider(
            color: Colors.black,
          ),
          SizedBox(height: 10),
          Text(hasilResponse),
        ],
      ),
    );
  }
}
