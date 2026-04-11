import 'package:detrack_test/core/resources/values/endpoints.dart';
import 'package:detrack_test/core/utils/helpers/result/result.dart';
import 'package:detrack_test/data/data_sources/impl/remote/target_location_datasource_impl.dart';
import 'package:detrack_test/data/models/responses/target_location_response/target_location_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../core/resources/dependency_mocks/services_mocks.dart';
import '../../core/resources/test_data/location.dart';

void main() {
  late MockDio dio;

  late TargetLocationDatasourceImpl targetLocationDatasourceImpl;

  setUp(() {
    dio = MockDio();

    targetLocationDatasourceImpl = TargetLocationDatasourceImpl(dio: dio);
  });

  test('getTargetLocation', () async {
    when(() => dio.get(Endpoints.targetLocation)).thenAnswer(
      (_) async => Response(
        data: testDataLocation,
        statusCode: 200,
        requestOptions: RequestOptions(path: '/target_location.json'),
      ),
    );

    final result = await targetLocationDatasourceImpl.getTargetLocation();

    expect(result, Result.success(TargetLocationResponse.fromJson(testDataLocation)));
  });

  test('getTargetLocation should return failure if statusCode is not 200', () async {
    when(() => dio.get(Endpoints.targetLocation)).thenAnswer(
      (_) async => Response(data: null, statusCode: 500, requestOptions: RequestOptions(path: '/target_location.json')),
    );

    final result = await targetLocationDatasourceImpl.getTargetLocation();

    expect(result.isFailure, true);
  });
}
