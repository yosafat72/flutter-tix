import 'package:flutter/material.dart';
import 'package:flutter_movie/res/app_context_extension.dart';

class LocationTheaterPicker extends StatefulWidget {
  const LocationTheaterPicker({super.key});

  @override
  State<StatefulWidget> createState() => LocationTheaterPickerWidget();
}

class LocationTheaterPickerWidget extends State<LocationTheaterPicker> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
            Text("KARAWANG",
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
            ))
          ]),
        ),
      ),
    );
  }
}
