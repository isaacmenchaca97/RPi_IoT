import 'package:flutter/material.dart';
import 'flutterfire_core_test.dart';
void main() => runApp(RPiIoT());

class RPiIoT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitApp(),
    );
  }
}
