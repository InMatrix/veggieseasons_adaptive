import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veggieseasons_adaptive/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Platform.isIOS
            ? CupertinoColors.systemGrey
            : const Color(0xff6750a4),
      ),
      home: const MyHomePage(title: 'Veggie Seasons Adaptive'),
    );
  }
}
