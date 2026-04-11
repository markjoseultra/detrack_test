import 'package:detrack_test/core/utils/helpers/result/result.dart';
import 'package:detrack_test/domain/entities/current_location_entity.dart';
import 'package:detrack_test/domain/entities/location_entity.dart';

abstract interface class DeviceLocationRepository {
  Future<Result<List<LocationEntity>>> getDeviceLocationHistory({required int numberOfReadings});
  Future<Result<LocationEntity>> saveDeviceLocation({
    required double lng,
    required double lat,
    required double distance,
  });
  Future<Result<CurrentLocationEntity>> getCurrentDeviceLocation();
}
