import 'package:detrack_test/core/utils/helpers/result/result.dart';
import 'package:detrack_test/domain/entities/target_location_entity.dart';

abstract interface class TargetLocationRepository {
  Future<Result<TargetLocationEntity>> getTargetLocation();
}
