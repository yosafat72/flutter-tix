import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie/res/app_context_extension.dart';
import 'package:flutter_movie/src/models/province.dart';
import 'package:flutter_movie/src/routes/route.dart';
import 'package:flutter_movie/src/utils/shared.preferences.util.dart';
import 'package:flutter_movie/src/views/widgets/banner.promo.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreen();
}

class HomeScreen extends State<HomeView> {
  var locationTheater = "";
  int selectedBottomBarIndex = 0;

  @override
  void initState() {
    super.initState();
    getLocationTheater();
  }

  getLocationTheater() async {
    String location =
        await SharedPreferencesUtils.getStoredValue('locationTheater');
    setState(() {
      Map<String, dynamic> jsonData = json.decode(location);
      final newLocation = ProvinceData.fromJson(jsonData);
      if (newLocation.name == "") {
        locationTheater = 'JAWA BARAT';
      } else {
        locationTheater = newLocation.name ?? "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [locationTheaterPicker(), const BannerPromo()],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget locationTheaterPicker() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(
            context, RouteConstanta.locationTheaterPicker);
      },
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.black12),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.location_pin,
                  color: context.resources.color.primaryColor,
                ),
              ),
              const SizedBox(width: 5.0),
              Text(locationTheater,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: context.resources.color.primaryColor,
                  )),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: context.resources.color.primaryColor,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
