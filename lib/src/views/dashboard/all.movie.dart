import 'package:flutter/material.dart';
import 'package:flutter_movie/res/app_context_extension.dart';
import 'package:flutter_movie/src/routes/route.dart';
import 'package:flutter_movie/src/views/dashboard/now.playing.dart';
import 'package:flutter_movie/src/views/widgets/appbar.with.back.button.dart';

class AllMovieView extends StatefulWidget {
  const AllMovieView({super.key});

  @override
  State<StatefulWidget> createState() => AllMovieScreen();
}

class AllMovieScreen extends State<AllMovieView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBarWithBackButton(
              context,
              context.resources.strings.filmBioskop,
              RouteConstanta.dashboardView,
              true),
          body: const TabBarView(children: [
            Center(
              child: NowPlayingView(),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
          ]),
        ));
  }
}
