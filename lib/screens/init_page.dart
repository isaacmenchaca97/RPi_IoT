import 'package:flutter/material.dart';
import '../constant.dart';
import '../libreria_iconos/r_pi_io_t_icons_icons.dart';
import '../components/reusable_card.dart';
import 'package:rpi_iot/components/content_card.dart';
import 'loading_fire.dart';
import 'error_fire.dart';
import 'package:firebase_core/firebase_core.dart';

class InitApp extends StatefulWidget {
  @override
  _InitAppState createState() => _InitAppState();
}

class _InitAppState extends State<InitApp> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if(_error) {
      return SomethingWentWrong();
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Loading();
    }

    return InitPage();
  }
}

class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

bool securityValue = false;
bool lightValue = false;
bool tvValue = false;
bool soundValue = false;

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
                                child: ContentCard(
                                  iconGatget: RPiIoTIcons.cctv,
                                  textDescription: 'Security Camera',
                                  switchContent: Container(
                                    alignment: Alignment.bottomRight,
                                    child: Switch(
                                        value: securityValue,
                                        onChanged: (bool newValue) {
                                          setState(() {
                                            securityValue = newValue;
                                          });
                                        }),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ReusableCard(
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
