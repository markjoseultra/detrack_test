import 'package:detrack_test/core/utils/helpers/result/result.dart';
import 'package:detrack_test/data/data_sources/target_location_datasource.dart';
import 'package:detrack_test/domain/entities/target_location_entity.dart';
import 'package:detrack_test/domain/repositories/target_location_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TargetLocationRepository)
class TargetLocationRepositoryImpl implements TargetLocationRepository {
  final TargetLocationDatasource _datasource;

  TargetLocationRepositoryImpl({required TargetLocationDatasource datasource}) : _datasource = datasource;

  @override
  Future<Result<TargetLocationEntity>> getTargetLocation() async {
    final response = await _datasource.getTargetLocation();

    return response.when(success: (data) => Result.success(data.toEntity()), failure: (error) => Result.failure(error));
  }
}
