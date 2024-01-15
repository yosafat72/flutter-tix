import 'package:json_annotation/json_annotation.dart';

part 'province.g.dart';

@JsonSerializable()
class Province {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  List<ProvinceData>? data;

  Province({this.status, this.message, this.data});

  factory Province.fromJson(Map<String, dynamic> data) =>
      _$ProvinceFromJson(data);

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}

@JsonSerializable()
class ProvinceData {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;

  ProvinceData({this.id, this.name});

  factory ProvinceData.fromJson(Map<String, dynamic> data) =>
      _$ProvinceDataFromJson(data);

  Map<String, dynamic> toJson() => _$ProvinceDataToJson(this);
}
