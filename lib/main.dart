import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_reminder/component/theme.dart';
import 'package:water_reminder/page/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Water Reminder',
      theme: HomeTheme().theme,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
    );
  }
}
