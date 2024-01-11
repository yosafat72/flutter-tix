import 'package:flutter/material.dart';
import 'package:flutter_movie/src/views/widgets/banner.promo.dart';
import 'package:flutter_movie/src/views/widgets/location.theater.picker.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreen();
}

class HomeScreen extends State<HomeView> {
  int selectedBottomBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
          child: const IntrinsicHeight(
              child: Column(
            children: [LocationTheaterPicker(), BannerPromo()],
          )),
        ));
      },
    );
  }
}
