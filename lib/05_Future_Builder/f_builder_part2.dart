import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class MyNewFuture extends StatelessWidget {
  List<Map<String, dynamic>> allUser = [];

  Future getAllUser() async {
    //Bahwa Builder digunakan untuk membangun bagian dari UI yang tidak terkait dengan Future, sementara FutureBuilder digunakan ketika Anda perlu menunggu hasil dari Future sebelum membangun bagian dari UI tertentu.
    //await Future.delayed(Duration(seconds: 10)); //manual

    //cara 2 otomatis pakai try and catch
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/users"));
      // var data = response.body; //masih dalam bentuk string ==> ubah ke dalam bentuk list map
      //ubah ke bentuk dynamic, baru ke map, baru diambil datanya
      List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
      data.forEach((element) {
        allUser.add(element); //sudah menambahkan data ke dalam allUser
      });
      print(allUser);
      //print(response.body);
    } catch (e) {
      //print jika terjadi error
      print("terjadi kesalahan");
      print(e);
      //(e) adalah exception
      //catch (e): Ini adalah bagian dari struktur try-catch di mana Anda menentukan jenis pengecualian yang ingin Anda tangani. Dalam kasus ini, e adalah nama variabel yang digunakan untuk mereferensikan objek pengecualian yang terjadi.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Future Builder"),
      ),
      body: FutureBuilder(
          future: getAllUser(),
          builder: (context, snapshot) {
            //parameter +1 snapshot untuk melihat lagi loading ngga pas ngambil data dari database
            if (snapshot.connectionState == ConnectionState.waiting) {
              //klolagi nunggu data dari server,tergantung internet/prosesloading
              return Center(
                child: Text("LOADING..........."),
              );
            } else {
              return ListView.builder(
                itemCount: allUser.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    backgroundImage: NetworkImage(allUser[index]['avatar']),
                  ),
                  title: Text(//Mengruwets dari allUser juga
                      "${allUser[index]["first_name"]} ${allUser[index]["last_name"]}"),
                  subtitle: Text("${allUser[index]["email"]}"),
                ),
              );
            }
          }),
    );
  }
}
