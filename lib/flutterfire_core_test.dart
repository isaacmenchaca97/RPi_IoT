import 'package:flutter/material.dart';
import 'firebase_screens/error_fire.dart';
import 'firebase_screens/loading_fire.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/init_page.dart';

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
