import 'package:detrack_test/core/utils/helpers/errors/default_error.dart';
import 'package:detrack_test/core/utils/helpers/result/result.dart';
import 'package:detrack_test/data/repositories/device_location_repository_impl.dart';
import 'package:detrack_test/domain/entities/current_location_entity.dart';
import 'package:detrack_test/domain/entities/location_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';

import '../../core/resources/dependency_mocks/datasource_mocks.dart';
import '../../core/resources/dependency_mocks/test_data.dart';

void main() {
  late MockLocationCollectionsDatasource mockLocationCollectionsDatasource;

  late MockDeviceLocationDatasource mockDeviceLocationDatasource;

  late DeviceLocationRepositoryImpl deviceLocationRepositoryImpl;

  setUp(() {
    mockLocationCollectionsDatasource = MockLocationCollectionsDatasource();

    mockDeviceLocationDatasource = MockDeviceLocationDatasource();

    deviceLocationRepositoryImpl = DeviceLocationRepositoryImpl(
      locationCollectionDatasource: mockLocationCollectionsDatasource,
      deviceLocationDatasource: mockDeviceLocationDatasource,
    );
  });

  group('getDeviceLocationHistory', () {
    test('Should execute getLocationCollections', () async {
      await deviceLocationRepositoryImpl.getDeviceLocationHistory(numberOfReadings: 5);

      verify(() => mockLocationCollectionsDatasource.getLocationCollections(numberOfReadings: 5)).called(1);
    });

    test('Should return empty list if data source is empty', () async {
      when(
        () => mockLocationCollectionsDatasource.getLocationCollections(numberOfReadings: 5),
      ).thenAnswer((_) async => []);

      final result = await deviceLocationRepositoryImpl.getDeviceLocationHistory(numberOfReadings: 5);

      expect(result, Result<List<LocationEntity>>.success([]));
    });

    test('Should return failure if data source fails', () async {
      when(() => mockLocationCollectionsDatasource.getLocationCollections(numberOfReadings: 5)).thenThrow(Exception());

      final result = await deviceLocationRepositoryImpl.getDeviceLocationHistory(numberOfReadings: 5);

      expect(result.isFailure, true);
    });
  });

  group('saveDeviceLocation', () {
    test('Should execute saveLocation', () async {
      await deviceLocationRepositoryImpl.saveDeviceLocation(lng: 1.0, lat: 1.0, distance: 1.0);

      verify(() => mockLocationCollectionsDatasource.saveLocation(lng: 1.0, lat: 1.0, distance: 1.0)).called(1);
    });

    test('Should return success if data source returns success', () async {
      when(
        () => mockLocationCollectionsDatasource.saveLocation(lng: 1.0, lat: 1.0, distance: 1.0),
      ).thenAnswer((_) async => TestData.locationCollectionResponse);

      final result = await deviceLocationRepositoryImpl.saveDeviceLocation(lng: 1.0, lat: 1.0, distance: 1.0);

      verify(() => mockLocationCollectionsDatasource.saveLocation(lng: 1.0, lat: 1.0, distance: 1.0)).called(1);

      expect(result, Result.success(TestData.locationCollectionResponse.toEntity()));
    });

    test('Should return failure if data source fails', () async {
      when(
        () => mockLocationCollectionsDatasource.saveLocation(lng: 1.0, lat: 1.0, distance: 1.0),
      ).thenThrow(Exception());

      final result = await deviceLocationRepositoryImpl.saveDeviceLocation(lng: 1.0, lat: 1.0, distance: 1.0);

      expect(result.isFailure, true);
    });
  });

  group('getCurrentDeviceLocation', () {
    final position = Position(
      longitude: 1.0,
      latitude: 1.0,
      timestamp: DateTime(1970),
      accuracy: 1.0,
      altitude: 1.0,
      altitudeAccuracy: 1.0,
      heading: 1.0,
      headingAccuracy: 1.0,
      speed: 1.0,
      speedAccuracy: 1.0,
    );

    test('Should execute getCurrentDeviceLocation', () async {
      when(
        () => mockDeviceLocationDatasource.getCurrentDeviceLocation(),
      ).thenAnswer((_) async => Result.success(position));

      await deviceLocationRepositoryImpl.getCurrentDeviceLocation();

      verify(() => mockDeviceLocationDatasource.getCurrentDeviceLocation()).called(1);
    });

    test('Should return CurrentLocationEntity', () async {
      when(
        () => mockDeviceLocationDatasource.getCurrentDeviceLocation(),
      ).thenAnswer((_) async => Result.success(position));

      final result = await deviceLocationRepositoryImpl.getCurrentDeviceLocation();

      expect(result, Result.success(CurrentLocationEntity(lng: 1.0, lat: 1.0)));
    });

    test('Should return failure if data source fails', () async {
      when(
        () => mockDeviceLocationDatasource.getCurrentDeviceLocation(),
      ).thenAnswer((_) async => Result.failure(DefaultError()));

      final result = await deviceLocationRepositoryImpl.getCurrentDeviceLocation();

      expect(result.isFailure, true);
    });
  });
}
