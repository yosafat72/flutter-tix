import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/res/app_context_extension.dart';

class NowPlayingWidget extends StatefulWidget {
  const NowPlayingWidget({super.key});

  @override
  State<StatefulWidget> createState() => NowPlayingWidgetState();
}

class NowPlayingWidgetState extends State<NowPlayingWidget> {
  var items = [
    "lib/res/images/movie_satu.jpeg",
    "lib/res/images/movie_dua.jpeg",
    "lib/res/images/movie_tiga.jpeg",
    "lib/res/images/movie_empat.jpeg",
    "lib/res/images/movie_lima.jpeg",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  context.resources.strings.sedangTayang,
                  style: TextStyle(
                      color: context.resources.color.primaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                )),
                Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        context.resources.strings.semua,
                        style: TextStyle(
                            color: context.resources.color.primaryColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal),
                      )),
                )
              ],
            ),
            SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: CarouselSlider(
                    items: items.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(i), fit: BoxFit.fill)),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                        height: 250.0,
                        autoPlay: false,
                        viewportFraction: 0.5,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        }),
                  ),
                ),
                Container(
                  child: Text(items[currentIndex]),
                )
              ],
            ))
          ],
        ));
  }
}
