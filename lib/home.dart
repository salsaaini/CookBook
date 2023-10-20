import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigation/layout_navbar.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LayoutNavigationBar(),
      ),
    );
  }
}