import 'package:detrack_test/data/data_sources/device_location_datasource.dart';
import 'package:detrack_test/data/data_sources/location_collections_datasource.dart';
import 'package:detrack_test/data/data_sources/target_location_datasource.dart';
import 'package:mocktail/mocktail.dart';

class MockDeviceLocationDatasource extends Mock implements DeviceLocationDatasource {}

class MockLocationCollectionsDatasource extends Mock implements LocationCollectionsDatasource {}

class MockTargetLocationDatasource extends Mock implements TargetLocationDatasource {}
