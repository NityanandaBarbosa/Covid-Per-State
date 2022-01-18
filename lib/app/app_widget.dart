import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brazil Covid per State',
      theme: ThemeData(primarySwatch: Colors.blue),
    ).modular();
  }
}