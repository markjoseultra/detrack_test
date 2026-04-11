// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TargetLocationResponse _$TargetLocationResponseFromJson(
  Map<String, dynamic> json,
) => _TargetLocationResponse(
  id: json['id'] as String,
  target_lat: (json['target_lat'] as num).toDouble(),
  target_lng: (json['target_lng'] as num).toDouble(),
);

Map<String, dynamic> _$TargetLocationResponseToJson(
  _TargetLocationResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'target_lat': instance.target_lat,
  'target_lng': instance.target_lng,
};
