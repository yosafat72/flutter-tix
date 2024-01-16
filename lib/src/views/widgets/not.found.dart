import 'package:flutter/material.dart';
import 'package:flutter_movie/res/app_context_extension.dart';
import 'package:lottie/lottie.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          height: 250,
          child: Lottie.asset("lib/res/assets/not_found.json"),
        ),
        Text(
          "Oops",
          style: TextStyle(
              color: context.resources.color.primaryColor,
              fontSize: 24.0,
              fontWeight: FontWeight.bold),
        ),
        Text(
          "Untuk sementara permintaan kamu tidak dapat kami proses",
          style: TextStyle(
              color: context.resources.color.nobel,
              fontSize: 12.0,
              fontWeight: FontWeight.normal),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
