import 'package:flutter/material.dart';

class TicketView extends StatefulWidget {
  const TicketView({super.key});

  @override
  State<StatefulWidget> createState() => TicketScreen();
}

class TicketScreen extends State<TicketView> {
  int selectedBottomBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "TicketView",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
