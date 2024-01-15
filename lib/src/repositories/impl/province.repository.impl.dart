import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_movie/src/models/province.dart';
import 'package:flutter_movie/src/repositories/province.repository.dart';

class ProvinceRepositoryImpl implements ProvinceRepository {
  @override
  Future<Province?> getProvince() async {
    try {
      dynamic response =
          await rootBundle.loadString('lib/res/assets/province.json');

      Map<String, dynamic> jsonData = json.decode(response);

      final data = Province.fromJson(jsonData);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
