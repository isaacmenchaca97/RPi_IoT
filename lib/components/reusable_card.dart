import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget child;
  ReusableCard({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.fromLTRB(8, 0, 8, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: kElevationToShadow[1],
      ),
    );
  }
}