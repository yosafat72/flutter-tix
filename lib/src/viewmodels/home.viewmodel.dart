import 'package:flutter/foundation.dart';
import 'package:flutter_movie/src/models/movie.dart';
import 'package:flutter_movie/src/repositories/impl/now.playing.repository.impl.dart';
import 'package:flutter_movie/src/repositories/now.playing.repository.dart';
import 'package:flutter_movie/src/service/response/api.response.dart';

class HomeViewModel extends ChangeNotifier {
  final NowPlayingRepository nowPlayingRepository = NowPlayingRepositoryImpl();

  ApiResponse<Movie> response = ApiResponse.loading();

  void setnowPlaying(ApiResponse<Movie> status) {
    response = status;
    notifyListeners();
  }

  Future<void> fetchNowPlaying() async {
    setnowPlaying(ApiResponse.loading());
    nowPlayingRepository
        .getNowPlaying()
        .then((value) => setnowPlaying(ApiResponse.success(value)))
        .onError((error, stackTrace) =>
            setnowPlaying(ApiResponse.error(error.toString())));
  }
}
