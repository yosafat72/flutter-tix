// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Province _$ProvinceFromJson(Map<String, dynamic> json) => Province(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProvinceData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ProvinceData _$ProvinceDataFromJson(Map<String, dynamic> json) => ProvinceData(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProvinceDataToJson(ProvinceData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
