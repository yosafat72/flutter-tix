import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie/res/app_context_extension.dart';
import 'package:flutter_movie/src/models/province.dart';
import 'package:flutter_movie/src/routes/route.dart';
import 'package:flutter_movie/src/service/response/status.dart';
import 'package:flutter_movie/src/utils/shared.preferences.util.dart';
import 'package:flutter_movie/src/viewmodels/province.viewmodel.dart';
import 'package:flutter_movie/src/views/widgets/appbar.with.back.button.dart';
import 'package:provider/provider.dart';

class LocationTheaterPicker extends StatefulWidget {
  const LocationTheaterPicker({super.key});

  @override
  State<StatefulWidget> createState() => LocationTheaterPickerWidget();
}

class LocationTheaterPickerWidget extends State<LocationTheaterPicker> {
  final ProvinceViewModel viewModel = ProvinceViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWithBackButton(
            context,
            context.resources.strings.locationTheaterPicker,
            RouteConstanta.dashboardView),
        body: observeProvince());
  }

  @override
  void initState() {
    viewModel.fetchProvince();
    super.initState();
  }

  saveValue(ProvinceData item) async {
    await SharedPreferencesUtils.saveValue('locationTheater', jsonEncode(item));
  }

  Widget observeProvince() {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<ProvinceViewModel>(builder: ((context, value, child) {
        switch (viewModel.response.status) {
          case Status.loading:
            return Text("loading.....");
          case Status.success:
            return listProvince(viewModel.response.data?.data);
          case Status.error:
            return Text(viewModel.response.message!);
          default:
            break;
        }
        return Container();
      })),
    );
  }

  Widget listProvince(List<ProvinceData>? items) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: items!.length,
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () {
                saveValue(items[position]);
                Navigator.popAndPushNamed(
                    context, RouteConstanta.dashboardView);
              },
              child: provinceItems(items[position]),
            );
          }),
    );
  }

  Widget provinceItems(ProvinceData data) {
    final argument = ModalRoute.of(context)!.settings.arguments as Map;
    print('Location id yang di terima ' + argument['locationId']);

    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Icon(
            Icons.location_city_rounded,
            size: 30.0,
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              data.name ?? "",
              style: TextStyle(color: context.resources.color.primaryColor),
            ),
          )),
          Wrap(
            children: [
              if (data.id == argument['locationId']) ...[
                Image.asset(
                  "lib/res/images/checked.png",
                  width: 35.0,
                  height: 35.0,
                ),
              ] else ...[
                Image.asset(
                  "lib/res/images/unchecked.png",
                  width: 35.0,
                  height: 35.0,
                ),
              ]
            ],
          )
        ],
      ),
    ));
  }
}
