import 'package:detrack_test/core/utils/helpers/errors/default_error.dart';
import 'package:detrack_test/core/utils/helpers/result/result.dart';
import 'package:detrack_test/domain/entities/current_location_entity.dart';
import 'package:detrack_test/domain/entities/location_entity.dart';
import 'package:detrack_test/domain/usecases/track_device_location_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../core/resources/dependency_mocks/repository_mocks.dart';

void main() {
  late MockDeviceLocationRepository mockDeviceLocationRepository;

  late TrackDeviceLocationUseCase trackDeviceLocationUseCase;

  setUp(() {
    mockDeviceLocationRepository = MockDeviceLocationRepository();

    trackDeviceLocationUseCase = TrackDeviceLocationUseCase(deviceLocationRepository: mockDeviceLocationRepository);
  });

  group('TrackDeviceLocationUseCase', () {
    test('Should execute getCurrentDeviceLocation and saveDeviceLocation', () async {
      when(
        () => mockDeviceLocationRepository.getCurrentDeviceLocation(),
      ).thenAnswer((_) async => Result.success(CurrentLocationEntity(lng: 1.0, lat: 1.0)));

      when(() => mockDeviceLocationRepository.saveDeviceLocation(lng: 1.0, lat: 1.0, distance: 0.0)).thenAnswer(
        (_) async =>
            Result.success(LocationEntity(id: 1, lng: 1.0, lat: 1.0, distance: 0.0, timestamp: DateTime(1970))),
      );

      await trackDeviceLocationUseCase(targetLat: 1.0, targetLng: 1.0);

      verify(() => mockDeviceLocationRepository.getCurrentDeviceLocation()).called(1);

      verify(() => mockDeviceLocationRepository.saveDeviceLocation(lng: 1.0, lat: 1.0, distance: 0.0)).called(1);
    });

    test('Should return failure if getCurrentDeviceLocation fails', () async {
      when(
        () => mockDeviceLocationRepository.getCurrentDeviceLocation(),
      ).thenAnswer((_) async => Result.failure(DefaultError()));

      final result = await trackDeviceLocationUseCase(targetLat: 1.0, targetLng: 1.0);

      expect(result.isFailure, true);
    });
  });
}
