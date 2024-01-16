import 'package:flutter/material.dart';
import 'package:flutter_movie/res/app_context_extension.dart';
import 'package:flutter_movie/src/models/movie.dart';
import 'package:flutter_movie/src/service/response/status.dart';
import 'package:flutter_movie/src/viewmodels/home.viewmodel.dart';
import 'package:provider/provider.dart';

class NowPlayingView extends StatefulWidget {
  const NowPlayingView({super.key});

  @override
  State<StatefulWidget> createState() => NowPlayingScreen();
}

class NowPlayingScreen extends State<NowPlayingView> {
  final HomeViewModel homeViewModel = HomeViewModel();

  final List<String> entries = <String>['A', 'B', 'C', 'D'];
  final List<int> colorCodes = <int>[600, 500, 100, 400];

  @override
  void initState() {
    super.initState();
    homeViewModel.fetchNowPlaying();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => homeViewModel,
      child: Consumer<HomeViewModel>(builder: ((context, value, child) {
        switch (homeViewModel.response.status) {
          case Status.loading:
            return Text("Loading...");
          case Status.success:
            return listMovie(homeViewModel.response.data?.results);
          case Status.error:
            return Text('error');
          default:
            break;
        }
        return Container(
          child: Text('default'),
        );
      })),
    );
  }

  Widget listMovie(List<Result>? results) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: results?.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: movieItem(results![index]),
          );
        });
  }

  Widget movieItem(Result result) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            SizedBox(
              width: 110,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500${result.posterPath}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('${result.title}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: context.resources.color.primaryColor,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 5),
                      Text(
                        '${result.overview}',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                          color: context.resources.color.nobel,
                        ),
                        maxLines: 3,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                            child: Image.asset(
                              "lib/res/images/semua_umur.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.play_arrow_rounded,
                          size: 30,
                          color: context.resources.color.primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
