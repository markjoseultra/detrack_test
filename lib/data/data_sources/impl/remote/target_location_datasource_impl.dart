import 'package:detrack_test/core/resources/values/endpoints.dart';
import 'package:detrack_test/core/resources/values/strings.dart';
import 'package:detrack_test/core/utils/helpers/errors/network_error.dart';
import 'package:detrack_test/core/utils/helpers/result/result.dart';
import 'package:detrack_test/data/data_sources/target_location_datasource.dart';
import 'package:detrack_test/data/models/responses/target_location_response/target_location_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TargetLocationDatasource)
class TargetLocationDatasourceImpl implements TargetLocationDatasource {
  @protected
  final Dio dio;

  TargetLocationDatasourceImpl({required this.dio});

  @override
  Future<Result<TargetLocationResponse>> getTargetLocation() async {
    final response = await dio.get(Endpoints.targetLocation);

    if (response.statusCode != 200) {
      return Result.failure(NetworkError(message: Strings.failedToGetTargetLocation));
    }

    return Result.success(TargetLocationResponse.fromJson(response.data));
  }
}
