import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Center(
        child: Text(
          "Settings \n(Yet to be implemented!)",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}
