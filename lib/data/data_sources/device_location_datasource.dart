import 'package:detrack_test/core/utils/helpers/result/result.dart';
import 'package:geolocator/geolocator.dart';

abstract interface class DeviceLocationDatasource {
  Future<Result<Position>> getCurrentDeviceLocation();

  Future<Result<bool>> getLocationPermission();
}
