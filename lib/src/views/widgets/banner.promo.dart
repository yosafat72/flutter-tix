import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerPromo extends StatelessWidget {
  const BannerPromo({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        "lib/res/images/banner_satu.png",
        "lib/res/images/banner_dua.jpeg",
        "lib/res/images/banner_tiga.jpeg",
        "lib/res/images/banner_empat.jpeg",
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage(i), fit: BoxFit.fill)),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 175.0,
        autoPlay: true,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}
