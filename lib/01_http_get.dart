import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as Myhttp;

class HttpGet extends StatefulWidget {
  const HttpGet({super.key});

  @override
  State<HttpGet> createState() => _HttpGetState();
}

class _HttpGetState extends State<HttpGet> {
  late String id;
  late String email;
  late String name;

  @override
  void initState() {
    id = "";
    email = "";
    name = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HTTP GET",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ID : $id",
              //id, //tadinya text belum ada data //nantiada text klo udah dimasukin datanya di bawah (onpressed)
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            Text(
              "EMAIL : $email",
              //email, //tadinya text belum ada data //nantiada text klo udah dimasukin datanya di bawah (onpressed)
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            Text(
              "NAME : $name",
              // name, //tadinya text belum ada data //nantiada text klo udah dimasukin datanya di bawah (onpressed)
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                var myResponse = await Myhttp.get(Uri.parse(
                    "https://reqres.in/api/users/5")); //testing for dummy API ==> https://reqres.in/

                if (myResponse.statusCode == 200) {
                  //berhasil get data
                  print(
                      "BERHASIL GET DATA"); //==> kudu diekstrak supaya bisakebaca datanya
                  Map<String, dynamic> data = json
                      .decode(
                          myResponse.body) as Map<String,
                      dynamic>; //json decode = mengubah stringmenjadi objek(dynamic)
                  print(data["data"]);
                  setState(() {
                    //supaya datanya muncul depan layar
                    id = data["data"]["id"].toString();
                    email = data["data"]["email"].toString();
                    name =
                        "${data["data"]["first_name"]} ${data["data"]["last_name"]}";
                  });
                } else {
                  //tidak berhasil get data nanti keluar 404
                  print("ERROR ${myResponse.statusCode}");
                  setState(() {
                    //supaya datanyamuncul depan layar
                    id = "ERROR ${myResponse.statusCode}";
                    email = "ERROR ${myResponse.statusCode}";
                    name = "ERROR ${myResponse.statusCode}";
                  });
                }

                // print("-----------------");
                // print(myResponse.body);
                // // print("-----------------");
                // // print(myResponse.statusCode); //200 artinya sukses
              },
              child: Text(
                "HTTP GET DATA",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.pink[300] ?? Colors.transparent)),
              //"Kamu bisa jadi pink, tapi kalau kamu gak bisa jadi pink, kamu bisa jadi...
              //hmmm, apa ya... oh ya, kamu bisa jadi transparan!" Nah, begitu tombol tahu rencana cadangannya, dia jadi happy dan gak rewel lagi!
            ),
          ],
        ),
      ),
    );
  }
}
