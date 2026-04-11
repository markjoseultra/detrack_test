import 'dart:async';

import 'package:detrack_test/core/resources/values/state_status.dart';
import 'package:detrack_test/core/utils/helpers/result/result.dart';
import 'package:detrack_test/domain/entities/location_entity.dart';
import 'package:detrack_test/domain/entities/target_location_entity.dart';
import 'package:detrack_test/domain/repositories/device_location_repository.dart';
import 'package:detrack_test/domain/repositories/target_location_repository.dart';
import 'package:detrack_test/domain/usecases/track_device_location_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_page_state.dart';
part 'home_page_cubit.freezed.dart';

@injectable
class HomePageCubit extends Cubit<HomePageState> {
  @protected
  final TrackDeviceLocationUseCase trackDeviceLocationUseCase;
  @protected
  final TargetLocationRepository targetLocationRepository;
  @protected
  final DeviceLocationRepository deviceLocationRepository;

  HomePageCubit({
    required this.deviceLocationRepository,
    required this.targetLocationRepository,
    required this.trackDeviceLocationUseCase,
  }) : super(const HomePageState());

  void loadLocationHistory() async {
    final result = await deviceLocationRepository.getDeviceLocationHistory(numberOfReadings: state.filterNumber);

    result.when(
      success: (data) => emit(state.copyWith(locations: data)),
      failure: (error) => emit(state.copyWith(status: FailedState())),
    );
  }

  void setFilterNumber({required int filterNumber}) {
    emit(state.copyWith(filterNumber: filterNumber));
    loadLocationHistory();
  }

  void toogleLocationTracking() {
    emit(state.copyWith(status: state.status != ActiveState() ? ActiveState() : InitialState()));
  }

  void trackLocation({int interval = 5}) async {
    if (state.targetLocation == null) {
      final result = await targetLocationRepository.getTargetLocation();

      result.when(
        success: (data) => emit(state.copyWith(targetLocation: data)),
        failure: (error) => emit(state.copyWith(status: FailedState(error))),
      );
    }

    if (state.targetLocation != null && state.status is ActiveState) {
      Timer.periodic(Duration(seconds: interval), (timer) async {
        if (state.status != ActiveState()) {
          timer.cancel();
        }
        final locationResult = await trackDeviceLocationUseCase(
          targetLat: state.targetLocation!.targetLat,
          targetLng: state.targetLocation!.targetLng,
        );
        locationResult.when(
          success: (data) {
            loadLocationHistory();
          },
          failure: (error) => emit(state.copyWith(status: FailedState(error))),
        );
      });
    }
  }
}
