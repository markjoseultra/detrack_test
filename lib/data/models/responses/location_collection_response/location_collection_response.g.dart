// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationCollectionResponse _$LocationCollectionResponseFromJson(
  Map<String, dynamic> json,
) => _LocationCollectionResponse(
  id: (json['id'] as num).toInt(),
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
  timestamp: DateTime.parse(json['timestamp'] as String),
  distance: (json['distance'] as num).toDouble(),
);

Map<String, dynamic> _$LocationCollectionResponseToJson(
  _LocationCollectionResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'lat': instance.lat,
  'lng': instance.lng,
  'timestamp': instance.timestamp.toIso8601String(),
  'distance': instance.distance,
};
