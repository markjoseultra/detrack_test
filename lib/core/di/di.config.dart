// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_sources/device_location_datasource.dart' as _i191;
import '../../data/data_sources/impl/local/device_location_datasource_impl.dart'
    as _i164;
import '../../data/data_sources/impl/local/locations_collections_datasource_impl.dart'
    as _i681;
import '../../data/data_sources/impl/remote/target_location_datasource_impl.dart'
    as _i102;
import '../../data/data_sources/location_collections_datasource.dart' as _i811;
import '../../data/data_sources/target_location_datasource.dart' as _i786;
import '../../data/repositories/device_location_repository_impl.dart' as _i355;
import '../../data/repositories/target_location_repository_impl.dart' as _i708;
import '../../domain/repositories/device_location_repository.dart' as _i344;
import '../../domain/repositories/target_location_repository.dart' as _i213;
import '../../domain/usecases/track_device_location_usecase.dart' as _i450;
import '../../presentation/pages/home_page/cubit/home_page_cubit.dart' as _i455;
import '../services/app_database/app_database.dart' as _i94;
import '../services/app_database/db_module.dart' as _i78;
import '../services/http_module/http_module.dart' as _i35;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dbModule = _$DbModule();
    final httpModule = _$HttpModule();
    gh.lazySingleton<_i94.AppDatabase>(() => dbModule.db);
    gh.lazySingleton<_i361.Dio>(() => httpModule.client);
    gh.lazySingleton<_i191.DeviceLocationDatasource>(
      () => _i164.DeviceLocationDatasourceImpl(),
    );
    gh.lazySingleton<_i786.TargetLocationDatasource>(
      () => _i102.TargetLocationDatasourceImpl(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i213.TargetLocationRepository>(
      () => _i708.TargetLocationRepositoryImpl(
        datasource: gh<_i786.TargetLocationDatasource>(),
      ),
    );
    gh.lazySingleton<_i811.LocationCollectionsDatasource>(
      () =>
          _i681.LocationsCollectionsDatasourceImpl(db: gh<_i94.AppDatabase>()),
    );
    gh.lazySingleton<_i344.DeviceLocationRepository>(
      () => _i355.DeviceLocationRepositoryImpl(
        locationCollectionDatasource: gh<_i811.LocationCollectionsDatasource>(),
        deviceLocationDatasource: gh<_i191.DeviceLocationDatasource>(),
      ),
    );
    gh.lazySingleton<_i450.TrackDeviceLocationUseCase>(
      () => _i450.TrackDeviceLocationUseCase(
        deviceLocationRepository: gh<_i344.DeviceLocationRepository>(),
      ),
    );
    gh.factory<_i455.HomePageCubit>(
      () => _i455.HomePageCubit(
        deviceLocationRepository: gh<_i344.DeviceLocationRepository>(),
        targetLocationRepository: gh<_i213.TargetLocationRepository>(),
        trackDeviceLocationUseCase: gh<_i450.TrackDeviceLocationUseCase>(),
      ),
    );
    return this;
  }
}

class _$DbModule extends _i78.DbModule {}

class _$HttpModule extends _i35.HttpModule {}
