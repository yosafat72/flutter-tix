import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie/src/routes/route.dart';
import 'package:flutter_movie/src/views/dashboard/all.movie.dart';
import 'package:flutter_movie/src/views/dashboard/dashboard.dart';
import 'package:flutter_movie/src/views/splash/splash.view.dart';
import 'package:flutter_movie/src/views/widgets/location.theater.picker.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.green));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: RouteConstanta.dashboardView,
      routes: {
        RouteConstanta.splashView: (context) => const SplashView(),
        RouteConstanta.dashboardView: (context) => const DashboardView(),
        RouteConstanta.locationTheaterPicker: (context) =>
            const LocationTheaterPicker(),
        RouteConstanta.allMovie: (context) => const AllMovieView()
      },
    );
  }
}
