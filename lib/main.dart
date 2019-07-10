import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(TrfManager());

class TrfManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traffic Manager',
      home: Home(),
    );
  }
}
