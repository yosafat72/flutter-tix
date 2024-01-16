import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/res/app_context_extension.dart';
import 'package:flutter_movie/src/models/movie.dart';
import 'package:flutter_movie/src/routes/route.dart';

class NowPlayingWidget extends StatefulWidget {
  final Movie? movie;
  const NowPlayingWidget({this.movie, super.key});

  @override
  State<StatefulWidget> createState() => NowPlayingWidgetState();
}

class NowPlayingWidgetState extends State<NowPlayingWidget> {
  int currentIndex = 0;

  Color generateRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    context.resources.strings.sedangTayang,
                    style: TextStyle(
                        color: context.resources.color.primaryColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RouteConstanta.allMovie);
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              context.resources.strings.semua,
                              style: TextStyle(
                                  color: context.resources.color.primaryColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_circle_right_rounded,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    generateRandomColor()
                  ],
                  tileMode: TileMode.mirror,
                ),
              ),
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: CarouselSlider(
                      items: widget.movie?.results?.map((data) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15.0)),
                                  image: DecorationImage(
                                      image: data.posterPath != null
                                          ? NetworkImage(
                                              'https://image.tmdb.org/t/p/w500${data.posterPath}')
                                          : const AssetImage(
                                                  'lib/res/images/movie_satu.jpeg')
                                              as ImageProvider,
                                      fit: BoxFit.fill)),
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
                    margin: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "${widget.movie?.results![currentIndex].originalTitle}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: context.resources.color.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                    child: Text(
                      "${widget.movie?.results![currentIndex].overview}",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                          color: context.resources.color.primaryColor),
                      textAlign: TextAlign.justify,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              )),
            )
          ],
        ));
  }
}
