import 'package:flutter/material.dart';
import 'package:projectatlas/home_page.dart';

class AtlasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}