import 'package:detrack_test/core/utils/helpers/errors/default_error.dart';
import 'package:detrack_test/core/utils/helpers/result/result.dart';
import 'package:detrack_test/data/data_sources/device_location_datasource.dart';
import 'package:detrack_test/data/data_sources/location_collections_datasource.dart';
import 'package:detrack_test/domain/entities/current_location_entity.dart';
import 'package:detrack_test/domain/entities/location_entity.dart';
import 'package:detrack_test/domain/repositories/device_location_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DeviceLocationRepository)
class DeviceLocationRepositoryImpl implements DeviceLocationRepository {
  @protected
  final LocationCollectionsDatasource locationCollectionDatasource;
  @protected
  final DeviceLocationDatasource deviceLocationDatasource;

  DeviceLocationRepositoryImpl({required this.locationCollectionDatasource, required this.deviceLocationDatasource});

  @override
  Future<Result<List<LocationEntity>>> getDeviceLocationHistory({required int numberOfReadings}) async {
    try {
      final items = await locationCollectionDatasource.getLocationCollections(numberOfReadings: numberOfReadings);

      if (items.isEmpty) return Result.success([]);

      return Result.success(items.map((i) => i.toEntity()).toList());
    } catch (e) {
      return Result.failure(DefaultError());
    }
  }

  @override
  Future<Result<LocationEntity>> saveDeviceLocation({
    required double lng,
    required double lat,
    required double distance,
  }) async {
    try {
      final item = await locationCollectionDatasource.saveLocation(lng: lng, lat: lat, distance: distance);

      return Result.success(item.toEntity());
    } catch (e) {
      return Result.failure(DefaultError());
    }
  }

  @override
  Future<Result<CurrentLocationEntity>> getCurrentDeviceLocation() async {
    final result = await deviceLocationDatasource.getCurrentDeviceLocation();

    return result.when(
      success: (data) => Result.success(CurrentLocationEntity(lat: data.latitude, lng: data.longitude)),
      failure: (error) => Result.failure(error),
    );
  }

  @override
  Future<Result<bool>> getDeviceLocationPermission() async {
    return await deviceLocationDatasource.getLocationPermission();
  }
}
