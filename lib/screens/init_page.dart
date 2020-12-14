import 'package:flutter/material.dart';
import 'package:rpi_iot/libreria_iconos/r_pi_io_t_icons2_0_icons.dart';
import 'package:rpi_iot/screens/smart_light.dart';
import '../constant.dart';
import '../libreria_iconos/r_pi_io_t_icons_icons.dart';
import '../components/reusable_card.dart';
import 'package:rpi_iot/components/content_card.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rpi_iot/screens/smart_fan.dart';

class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

bool fanValue = false;
bool lightValue = false;
bool tvValue = false;
bool soundValue = false;
var database = FirebaseDatabase.instance.reference();

class _InitPageState extends State<InitPage> {
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
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 27,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 23, horizontal: 20),
                child: Text(
                  'My home',
                  style: kHeaderText,
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 28,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'A total of 4 devices',
                              style: kSubtitleText,
                            ),
                            Text(
                              'Living Room',
                              style: kRoomText,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: ReusableCard(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SmartFan(),
                                    ),
                                  );
                                },
                                child: ContentCard(
                                  iconGatget: RPiIoTIcons2_0.fan_svg,
                                  textDescription: 'Smart Fan',
                                  switchContent: Container(
                                    alignment: Alignment.bottomRight,
                                    child: Switch(
                                        value: fanValue,
                                        onChanged: (bool newValue) {
                                          setState(() {
                                            fanValue = newValue;
                                            database.update({'fan': fanValue});
                                          });
                                        }),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ReusableCard(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SmartLight(),
                                    ),
                                  );
                                },
                                child: ContentCard(
                                  iconGatget: RPiIoTIcons.light_svg,
                                  textDescription: 'Smart Light',
                                  switchContent: Container(
                                    alignment: Alignment.bottomRight,
                                    child: Switch(
                                        value: lightValue,
                                        onChanged: (bool newValue) {
                                          setState(() {
                                            lightValue = newValue;
                                            database
                                                .update({'light': lightValue});
                                          });
                                        }),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: ReusableCard(
                                child: ContentCard(
                                  iconGatget: RPiIoTIcons.smart_tv_svg,
                                  textDescription: 'Smart TV',
                                  switchContent: Container(
                                    alignment: Alignment.bottomRight,
                                    child: Switch(
                                        value: tvValue,
                                        onChanged: (bool newValue) {
                                          setState(() {
                                            tvValue = newValue;
                                          });
                                        }),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ReusableCard(
                                child: ContentCard(
                                  iconGatget: RPiIoTIcons.speaker_svg,
                                  textDescription: 'Smart Sound',
                                  switchContent: Container(
                                    alignment: Alignment.bottomRight,
                                    child: Switch(
                                        value: soundValue,
                                        onChanged: (bool newValue) {
                                          setState(() {
                                            soundValue = newValue;
                                          });
                                        }),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
