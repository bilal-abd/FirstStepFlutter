import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Exo6',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MonApp(),
    );
  }
}
