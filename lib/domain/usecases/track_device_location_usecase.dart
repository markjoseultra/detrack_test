import 'package:detrack_test/core/utils/helpers/result/result.dart';
import 'package:detrack_test/core/utils/mixins/haversine_mixin.dart';
import 'package:detrack_test/domain/repositories/device_location_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TrackDeviceLocationUseCase with HaversineMixin {
  @protected
  final DeviceLocationRepository deviceLocationRepository;

  TrackDeviceLocationUseCase({required this.deviceLocationRepository});

  Future<Result<void>> call({required double targetLng, required double targetLat}) async {
    final result = await deviceLocationRepository.getCurrentDeviceLocation();

    return result.when(
      success: (data) async {
        final double distance = haversine(targetLat, targetLng, data.lat, data.lng);

        await deviceLocationRepository.saveDeviceLocation(lng: data.lng, lat: data.lat, distance: distance);

        return Result.success(null);
      },
      failure: (error) => Result.failure(error),
    );
  }
}
