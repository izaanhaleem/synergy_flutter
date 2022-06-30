import 'package:flutter/material.dart';
import 'package:synergy_flutter/Splash.dart';
import 'package:synergy_flutter/SynergyPages/EpiStoreMonitoring.dart';
import 'package:synergy_flutter/SynergyPages/LoginPage.dart';

import 'SynergyPages/ModuleList.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}


