import 'package:flutter/material.dart';
import 'screens/init_page.dart';

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
