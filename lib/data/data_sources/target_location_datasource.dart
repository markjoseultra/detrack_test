import 'package:detrack_test/core/utils/helpers/result/result.dart';
import 'package:detrack_test/data/models/responses/target_location_response/target_location_response.dart';

abstract interface class TargetLocationDatasource {
  Future<Result<TargetLocationResponse>> getTargetLocation();
}
