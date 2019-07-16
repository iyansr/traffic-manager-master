import 'package:flutter/material.dart';
import 'package:traffic_manager/home.dart';

void main() => runApp(TrfManager());

class TrfManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traffic Manager',
      home: Home(),
    );
  }
}
