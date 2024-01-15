import 'package:flutter/material.dart';
import 'package:flutter_movie/res/app_context_extension.dart';
import 'package:flutter_movie/src/routes/route.dart';
import 'package:flutter_movie/src/views/widgets/appbar.with.back.button.dart';

class LocationTheaterPicker extends StatefulWidget {
  const LocationTheaterPicker({super.key});

  @override
  State<StatefulWidget> createState() => LocationTheaterPickerWidget();
}

class LocationTheaterPickerWidget extends State<LocationTheaterPicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBackButton(
          context,
          context.resources.strings.locationTheaterPicker,
          RouteConstanta.dashboardView),
      body: Center(
        child: Text("as"),
      ),
    );
  }
}
