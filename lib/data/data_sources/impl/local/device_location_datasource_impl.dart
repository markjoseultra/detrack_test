import 'package:detrack_test/core/utils/helpers/errors/location_error.dart';
import 'package:detrack_test/core/utils/helpers/result/result.dart';
import 'package:detrack_test/data/data_sources/device_location_datasource.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DeviceLocationDatasource)
class DeviceLocationDatasourceImpl implements DeviceLocationDatasource {
  @override
  Future<Result<Position>> getCurrentDeviceLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Result.failure(LocationServiceDisabledError());
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Result.failure(LocationPermissionDeniedError());
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Result.failure(LocationPermissionDeniedForeverError());
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final currentPosition = await Geolocator.getCurrentPosition();

    return Result.success(currentPosition);
  }

  @override
  Future<Result<bool>> getLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Result.failure(LocationServiceDisabledError());
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Result.failure(LocationPermissionDeniedError());
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Result.failure(LocationPermissionDeniedForeverError());
    }

    return Result.success(true);
  }
}
