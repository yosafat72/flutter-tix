import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie/res/app_context_extension.dart';
import 'package:flutter_movie/src/models/province.dart';
import 'package:flutter_movie/src/routes/route.dart';
import 'package:flutter_movie/src/service/response/status.dart';
import 'package:flutter_movie/src/utils/shared.preferences.util.dart';
import 'package:flutter_movie/src/viewmodels/home.viewmodel.dart';
import 'package:flutter_movie/src/views/widgets/banner.promo.dart';
import 'package:flutter_movie/src/views/widgets/now.playing.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreen();
}

class HomeScreen extends State<HomeView> {
  final HomeViewModel viewModel = HomeViewModel();

  var locationTheater = "";
  var locationTheaterId = "";
  int selectedBottomBarIndex = 0;

  @override
  void initState() {
    super.initState();
    viewModel.fetchNowPlaying();
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
        locationTheaterId = "";
      } else {
        locationTheater = newLocation.name ?? "";
        locationTheaterId = newLocation.id ?? "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<HomeViewModel>(builder: ((context, value, child) {
          return LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        locationTheaterPicker(),
                        const BannerPromo(),
                        if (viewModel.response.status == Status.loading)
                          ...[]
                        else if (viewModel.response.status ==
                            Status.success) ...[
                          NowPlayingWidget(
                            movie: viewModel.response.data,
                          )
                        ] else if (viewModel.response.status == Status.error)
                          ...[]
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        })));
  }

  Widget locationTheaterPicker() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(
            context, RouteConstanta.locationTheaterPicker,
            arguments: {'locationId': locationTheaterId});
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
