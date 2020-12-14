import 'package:flutter/material.dart';
import 'package:rpi_iot/constant.dart';
import 'package:firebase_database/firebase_database.dart';


class SmartFan extends StatefulWidget {
  @override
  _SmartFanState createState() => _SmartFanState();
}

int valueSlider = 50;
var database = FirebaseDatabase.instance.reference();


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
        child: Slider(
            value: valueSlider.toDouble(),
            min: 0,
            max: 100,
            onChanged: (double newValue) {
              setState(() {
                valueSlider = newValue.round();
                database.update({'fanValue': valueSlider});
              });
            }),
      ),
    );
  }
}
