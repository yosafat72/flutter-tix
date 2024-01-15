import 'package:flutter/material.dart';
import 'package:flutter_movie/src/models/province.dart';
import 'package:flutter_movie/src/repositories/impl/province.repository.impl.dart';
import 'package:flutter_movie/src/repositories/province.repository.dart';
import 'package:flutter_movie/src/service/response/api.response.dart';

class ProvinceViewModel extends ChangeNotifier {
  final ProvinceRepository repository = ProvinceRepositoryImpl();

  ApiResponse<Province> response = ApiResponse.loading();

  void setProvince(ApiResponse<Province> status) {
    response = status;
    notifyListeners();
  }

  Future<void> fetchProvince() async {
    setProvince(ApiResponse.loading());
    repository
        .getProvince()
        .then((value) => setProvince(ApiResponse.success(value)))
        .onError((error, stackTrace) =>
            setProvince(ApiResponse.error(error.toString())));
  }
}
