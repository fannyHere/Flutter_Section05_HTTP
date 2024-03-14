import 'package:flutter/material.dart';
import 'package:section_5_http/04_http_delete.dart';

void main() {
  runApp(HttpReq());
}

class HttpReq extends StatelessWidget {
  const HttpReq({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: http_delete(),
    );
  }
}
