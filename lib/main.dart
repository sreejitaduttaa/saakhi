import 'package:flutter/material.dart';
import 'dashboard.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Saakhi",
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: Dashboard()),
    );
  }
}
