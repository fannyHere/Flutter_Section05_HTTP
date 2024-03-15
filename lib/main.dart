import 'package:flutter/material.dart';
import 'package:section_5_http/05_Future_Builder/f_builder_part2.dart';

void main() {
  runApp(HttpReq());
}

class HttpReq extends StatelessWidget {
  const HttpReq({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyNewFuture(),
    );
  }
}
