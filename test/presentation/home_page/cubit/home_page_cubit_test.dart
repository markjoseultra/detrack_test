import 'package:bloc_test/bloc_test.dart';
import 'package:detrack_test/core/resources/values/state_status.dart';
import 'package:detrack_test/core/utils/helpers/errors/default_error.dart';
import 'package:detrack_test/core/utils/helpers/errors/network_error.dart';
import 'package:detrack_test/core/utils/helpers/result/result.dart';
import 'package:detrack_test/domain/entities/location_entity.dart';
import 'package:detrack_test/domain/entities/target_location_entity.dart';
import 'package:detrack_test/presentation/pages/home_page/cubit/home_page_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../core/resources/dependency_mocks/repository_mocks.dart';
import '../../../core/resources/dependency_mocks/usecase_mocks.dart';

void main() {
  late MockDeviceLocationRepository mockDeviceLocationRepository;

  late MockTargetLocationRepository mockTargetLocationRepository;

  late MockTrackDeviceLocationUseCase mockTrackDeviceLocationUseCase;

  late HomePageCubit cubit;

  setUp(() {
    mockDeviceLocationRepository = MockDeviceLocationRepository();
    mockTargetLocationRepository = MockTargetLocationRepository();
    mockTrackDeviceLocationUseCase = MockTrackDeviceLocationUseCase();
    cubit = HomePageCubit(
      deviceLocationRepository: mockDeviceLocationRepository,
      targetLocationRepository: mockTargetLocationRepository,
      trackDeviceLocationUseCase: mockTrackDeviceLocationUseCase,
    );
  });

  group('loadLocationHistory', () {
    blocTest(
      'loadLocationHistory Should emit the list of LocationEntity on success',
      build: () => cubit,
      act: (cubit) => cubit.loadLocationHistory(),
      setUp: () {
        when(() => mockDeviceLocationRepository.getDeviceLocationHistory(numberOfReadings: 20)).thenAnswer(
          (_) async =>
              Result.success([LocationEntity(id: 1, lng: 1.0, lat: 1.0, distance: 1.0, timestamp: DateTime(1970))]),
        );
      },
      expect: () => [
        HomePageState(locations: [LocationEntity(id: 1, lng: 1.0, lat: 1.0, distance: 1.0, timestamp: DateTime(1970))]),
      ],
    );

    blocTest(
      'loadLocationHistory Should emit FailedState if getDeviceLocationHistory fails',
      build: () => cubit,
      act: (cubit) => cubit.loadLocationHistory(),
      setUp: () {
        when(
          () => mockDeviceLocationRepository.getDeviceLocationHistory(numberOfReadings: 20),
        ).thenAnswer((_) async => Result.failure(DefaultError()));
      },
      expect: () => [HomePageState(status: FailedState())],
    );
  });

  group('setFilterNumber', () {
    blocTest(
      'setFilterNumber Should emit the set filterNumer and execute getDeviceLocationHistory',
      build: () => cubit,
      act: (cubit) => cubit.setFilterNumber(filterNumber: 5),
      setUp: () {
        when(() => mockDeviceLocationRepository.getDeviceLocationHistory(numberOfReadings: 5)).thenAnswer(
          (_) async =>
              Result.success([LocationEntity(id: 1, lng: 1.0, lat: 1.0, distance: 1.0, timestamp: DateTime(1970))]),
        );
      },
      expect: () => [
        HomePageState(filterNumber: 5),
        HomePageState(
          filterNumber: 5,
          locations: [LocationEntity(id: 1, lng: 1.0, lat: 1.0, distance: 1.0, timestamp: DateTime(1970))],
        ),
      ],
    );
  });

  group('toogleLocationTracking', () {
    blocTest(
      'toogleLocationTracking Should emit ActiveState if status is not ActiveState',
      build: () => cubit,
      act: (cubit) => cubit.toogleLocationTracking(),
      expect: () => [HomePageState(status: ActiveState())],
    );

    blocTest(
      'toogleLocationTracking Should emit InitialState if status is ActiveState',
      build: () => cubit,
      seed: () => HomePageState(status: ActiveState()),
      act: (cubit) => cubit.toogleLocationTracking(),
      expect: () => [HomePageState(status: InitialState())],
    );
  });

  group('trackLocation', () {
    blocTest(
      'trackLocation Should emit ActiveState first',
      build: () => cubit,
      seed: () => HomePageState(status: ActiveState()),
      act: (cubit) => cubit.trackLocation(),
      setUp: () {
        when(
          () => mockTrackDeviceLocationUseCase(targetLat: 1.0, targetLng: 1.0),
        ).thenAnswer((_) async => Result.success(null));
        when(
          () => mockTargetLocationRepository.getTargetLocation(),
        ).thenAnswer((_) async => Result.success(TargetLocationEntity(id: '1', targetLng: 1.0, targetLat: 1.0)));
        when(
          () => mockDeviceLocationRepository.getDeviceLocationHistory(numberOfReadings: 20),
        ).thenAnswer((_) async => Result.success([]));
      },
      expect: () => [
        HomePageState(
          status: ActiveState(),
          targetLocation: TargetLocationEntity(id: '1', targetLng: 1.0, targetLat: 1.0),
        ),
      ],
    );

    blocTest(
      'trackLocation Should emit FailedState if getTargetLocation fails',
      build: () => cubit,
      seed: () => HomePageState(status: ActiveState()),
      act: (cubit) => cubit.trackLocation(),
      setUp: () {
        when(
          () => mockTrackDeviceLocationUseCase(targetLat: 1.0, targetLng: 1.0),
        ).thenAnswer((_) async => Result.success(null));
        when(
          () => mockTargetLocationRepository.getTargetLocation(),
        ).thenAnswer((_) async => Result.failure(NetworkError()));
        when(
          () => mockDeviceLocationRepository.getDeviceLocationHistory(numberOfReadings: 20),
        ).thenAnswer((_) async => Result.success([]));
      },
      expect: () => [HomePageState(status: FailedState(NetworkError()))],
    );

    blocTest(
      'trackLocation Should emit FailedState if TrackDeviceLocationUseCase fails',
      build: () => cubit,
      seed: () => HomePageState(status: ActiveState()),
      act: (cubit) => cubit.trackLocation(),
      wait: Duration(seconds: 5),
      setUp: () {
        when(
          () => mockTrackDeviceLocationUseCase(targetLat: 1.0, targetLng: 1.0),
        ).thenAnswer((_) async => Result.failure(DefaultError()));
        when(
          () => mockTargetLocationRepository.getTargetLocation(),
        ).thenAnswer((_) async => Result.success(TargetLocationEntity(id: '1', targetLng: 1.0, targetLat: 1.0)));
        when(
          () => mockDeviceLocationRepository.getDeviceLocationHistory(numberOfReadings: 20),
        ).thenAnswer((_) async => Result.success([]));
      },
      expect: () => [
        HomePageState(
          status: ActiveState(),
          targetLocation: TargetLocationEntity(id: '1', targetLng: 1.0, targetLat: 1.0),
        ),
        HomePageState(
          status: FailedState(DefaultError()),
          targetLocation: TargetLocationEntity(id: '1', targetLng: 1.0, targetLat: 1.0),
        ),
      ],
    );
  });
}
