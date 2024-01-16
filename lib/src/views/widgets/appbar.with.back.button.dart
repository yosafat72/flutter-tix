import 'package:flutter/material.dart';
import 'package:flutter_movie/res/app_context_extension.dart';

PreferredSizeWidget AppBarWithBackButton(
    BuildContext context, String title, String routeName, bool isTabbar) {
  return AppBar(
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
      leading: IconButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, routeName);
        },
        icon: const Icon(
          Icons.arrow_back, // Use the appropriate back arrow icon
          color: Colors.white,
        ),
      ),
      title: SizedBox(
          height: 30.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ],
          )),
      bottom: isTabbar
          ? const TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  child: Text("SEDANG TAYANG"),
                ),
                Tab(
                  child: Text("AKAN DATANG"),
                ),
              ],
            )
          : null);
}
