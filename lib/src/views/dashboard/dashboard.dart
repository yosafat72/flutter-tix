import 'package:flutter/material.dart';
import 'package:flutter_movie/res/app_context_extension.dart';
import 'package:flutter_movie/src/views/dashboard/cinema.dart';
import 'package:flutter_movie/src/views/dashboard/home.dart';
import 'package:flutter_movie/src/views/dashboard/ticket.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<StatefulWidget> createState() => DashboardScreen();
}

class DashboardScreen extends State<DashboardView> {
  int selectedBottomBarIndex = 0;

  static const List listOfMenu = [HomeView(), CinemaView(), TicketView()];

  void onBottomBarItemTapped(int index) {
    setState(() {
      selectedBottomBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.resources.color.darkBlue,
                context.resources.color.darkBlue
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: SizedBox(
          height: 30.0,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search...",
              hintStyle: TextStyle(color: Colors.grey.shade600),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey.shade600,
                size: 18,
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: const EdgeInsets.all(5),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey.shade100)),
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ))
        ],
      ),
      body: listOfMenu.elementAt(selectedBottomBarIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Bioskop'),
          BottomNavigationBarItem(icon: Icon(Icons.theaters), label: 'Tiket')
        ],
        currentIndex: selectedBottomBarIndex,
        selectedItemColor: context.resources.color.primaryColor,
        onTap: onBottomBarItemTapped,
      ),
    );
  }
}
