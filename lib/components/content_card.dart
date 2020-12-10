import 'package:flutter/material.dart';
import 'package:rpi_iot/constant.dart';

class ContentCard extends StatelessWidget {
  final Container switchContent;
  final IconData iconGatget;
  final String textDescription;
  ContentCard({this.iconGatget, this.textDescription, this.switchContent});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            iconGatget,
            size: 45,
          ),
          // SizedBox(height: 20),
          Text(
            textDescription,
            style: kSubtitleText,
          ),
          switchContent
        ],
      ),
    );
  }
}
