import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_movie/src/models/movie.dart';
import 'package:flutter_movie/src/repositories/now.playing.repository.dart';

class NowPlayingRepositoryImpl implements NowPlayingRepository {
  @override
  Future<Movie?> getNowPlaying() async {
    try {
      dynamic response =
          await rootBundle.loadString('lib/res/assets/now_playing.json');

      Map<String, dynamic> jsonData = json.decode(response);

      final data = Movie.fromJson(jsonData);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
