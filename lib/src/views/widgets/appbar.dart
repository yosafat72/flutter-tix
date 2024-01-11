import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<StatefulWidget> createState() => AppBarWidgetComponent();
}

class AppBarWidgetComponent extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(color: Colors.white54),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
