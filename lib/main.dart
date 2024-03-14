import 'package:flutter/material.dart';
import 'package:section_5_http/03_http_put/03_http_put_patch.dart';

void main() {
  runApp(HttpReq());
}

class HttpReq extends StatelessWidget {
  const HttpReq({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HTTP_put_patch(),
    );
  }
}
