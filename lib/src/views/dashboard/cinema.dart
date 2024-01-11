import 'package:flutter/material.dart';

class CinemaView extends StatefulWidget {
  const CinemaView({super.key});

  @override
  State<StatefulWidget> createState() => CinemaScreen();
}

class CinemaScreen extends State<CinemaView> {
  int selectedBottomBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "CinemaView",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
