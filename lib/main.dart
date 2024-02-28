import 'package:flutter/material.dart';
import 'package:section_5_http/01_http_get.dart';

void main() {
  runApp(HttpReq());
}

class HttpReq extends StatelessWidget {
  const HttpReq({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpGet(),
    );
  }
}
