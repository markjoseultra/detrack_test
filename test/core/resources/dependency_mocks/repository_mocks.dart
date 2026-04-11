import 'package:detrack_test/domain/repositories/device_location_repository.dart';
import 'package:detrack_test/domain/repositories/target_location_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockDeviceLocationRepository extends Mock implements DeviceLocationRepository {}

class MockTargetLocationRepository extends Mock implements TargetLocationRepository {}
