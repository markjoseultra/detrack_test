import 'package:detrack_test/domain/entities/location_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_collection_response.freezed.dart';
part 'location_collection_response.g.dart';

@freezed
abstract class LocationCollectionResponse with _$LocationCollectionResponse {
  const LocationCollectionResponse._();

  const factory LocationCollectionResponse({
    required int id,
    required double lat,
    required double lng,
    required DateTime timestamp,
    required double distance,
  }) = _LocationCollectionResponse;

  factory LocationCollectionResponse.fromJson(Map<String, Object?> json) => _$LocationCollectionResponseFromJson(json);

  LocationEntity toEntity() => LocationEntity(id: id, lng: lng, lat: lat, distance: distance, timestamp: timestamp);
}
