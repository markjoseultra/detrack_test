import 'package:detrack_test/domain/entities/target_location_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'target_location_response.freezed.dart';
part 'target_location_response.g.dart';

@freezed
abstract class TargetLocationResponse with _$TargetLocationResponse {
  const TargetLocationResponse._();

  const factory TargetLocationResponse({required String id, required double target_lat, required double target_lng}) =
      _TargetLocationResponse;

  factory TargetLocationResponse.fromJson(Map<String, Object?> json) => _$TargetLocationResponseFromJson(json);

  TargetLocationEntity toEntity() => TargetLocationEntity(id: id, targetLat: target_lat, targetLng: target_lng);
}
