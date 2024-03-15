import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyOldFuture extends StatefulWidget {
  const MyOldFuture({super.key});

  @override
  State<MyOldFuture> createState() => _MyOldFutureState();
}

class _MyOldFutureState extends State<MyOldFuture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Future Builder"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              //get data URL API
              var response =
                  await http.get(Uri.parse("https://reqres.in/api/users"));
              //print(response.body);
              //output dari hasil print(response.body):
              //mengeluarkan semua list biodata dari API
              // {"page":1,"per_page":6,"total":12,"total_pages":2,"data":[{"id":1,"email":"george.bluth@reqres.in","first_name":"George","last_name":"Bluth","avatar":"https://reqres.in/img/faces/1-image.jpg"},{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},{"id":3,"email":"emma.wong@reqres.in","first_name":"Emma","last_name":"Wong","avatar":"https://reqres.in/img/faces/3-image.jpg"},{"id":4,"email":"eve.holt@reqres.in","first_name":"Eve","last_name":"Holt","avatar":"https://reqres.in/img/faces/4-image.jpg"},{"id":5,"email":"charles.morris@reqres.in","first_name":"Charles","last_name":"Morris","avatar":"https://reqres.in/img/faces/5-image.jpg"},{"id":6,"email":"tracey.ramos@reqres.in","first_name":"Tracey","last_name":"Ramos","avatar":"https://reqres.in/img/faces/6-image.jpg"}],"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}

              //gamau ambil semuanyaaaa tapi mau ambil data list per user
              //bentuk data dari API nya itu List yg dalamnya mapping
              //nyimpen data dalam bentuk var terus json di decode untuk ambil respon bodynya (bentuknya List)
              //cuma mau ambilbentuk datanya aja yg bentuknya mapping,nah terus cuma mau ambil datanya aja yg bentuknya list dalemnya map==> ubah var jadi list
              // var data =
              //     (jsonDecode(response.body) as Map<String, dynamic>)["data"];
              // List<Map<String, dynamic>> data =
              //     (jsonDecode(response.body) as Map<String, dynamic>)["data"]
              //         as List<Map<String, dynamic>>;
              // print(data);
              //output dari print(data)=> Expected a value of type 'List<Map<String, dynamic>>', but got one of type 'List<dynamic>
              //jadi si datanya itu gamau bentuknya list map, tapi maunya list dataoke ubah deh:
              List data =
                  (jsonDecode(response.body) as Map<String, dynamic>)["data"];
              //print(data);
              //outputnya: [{id: 1, email: george.bluth@reqres.in, first_name: George, last_name: Bluth, avatar: https://reqres.in/img/faces/1-image.jpg}, {id: 2, email: janet.weaver@reqres.in, first_name: Janet, last_name: Weaver, avatar: https://reqres.in/img/faces/2-image.jpg}, {id: 3, email: emma.wong@reqres.in, first_name: Emma, last_name: Wong, avatar: https://reqres.in/img/faces/3-image.jpg}, {id: 4, email: eve.holt@reqres.in, first_name: Eve, last_name: Holt, avatar: https://reqres.in/img/faces/4-image.jpg}, {id: 5, email: charles.morris@reqres.in, first_name: Charles, last_name: Morris, avatar: https://reqres.in/img/faces/5-image.jpg}, {id: 6, email: tracey.ramos@reqres.in, first_name: Tracey, last_name: Ramos, avatar: https://reqres.in/img/faces/6-image.jpg}]
              // print(data[0] as Map<String,
              //     dynamic>); //berlaku untuk tipe data satu2 //mau ngeprint tipe data yg pertama as data type map, yaitu 0 ==> outputnya {id: 1, email: george.bluth@reqres.in, first_name: George, last_name: Bluth, avatar: https://reqres.in/img/faces/1-image.jpg}
              //klo mau ngebuat hasil print itu semua dlm bentuk Map satu-satu per element ===> maka dibuat data type mapping dan looping for each element
              data.forEach((element) {
                Map<String, dynamic> user = element;
                print(user["email"]);
              });
//versi AI:
              // List<Map<String, dynamic>> data =
              //     (jsonDecode(response.body)["data"] as List<dynamic>)
              //         .cast<Map<String, dynamic>>();

//versi kuldii: gajalan
              // List<Map<String, dynamic>> data =
              //     (jsonDecode(response.body) as Map<String, dynamic>)["data"]
              //         as List<Map<String, dynamic>>;
              // ; //udah dibentukjadimapping dan diambilbagian datanya

              // print(data[1]);
            },
            child: Text("KLIK LAH")),
      ),
    );
  }
}
