import 'package:flutter/material.dart';
import 'package:rpi_iot/constant.dart';

class SmartFan extends StatefulWidget {
  @override
  _SmartFanState createState() => _SmartFanState();
}

class _SmartFanState extends State<SmartFan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kRightGradientColor, kLeftGradientColor],
          ),
        ),
      ),
    );
  }
}