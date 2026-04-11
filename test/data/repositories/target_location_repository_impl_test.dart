import 'package:detrack_test/core/utils/helpers/errors/network_error.dart';
import 'package:detrack_test/core/utils/helpers/result/result.dart';
import 'package:detrack_test/data/models/responses/target_location_response/target_location_response.dart';
import 'package:detrack_test/data/repositories/target_location_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../core/resources/dependency_mocks/datasource_mocks.dart';
import '../../core/resources/test_data/location.dart';

void main() {
  late MockTargetLocationDatasource mockTargetLocationDatasource;
  late TargetLocationRepositoryImpl targetLocationRepositoryImpl;

  setUp(() {
    mockTargetLocationDatasource = MockTargetLocationDatasource();
    targetLocationRepositoryImpl = TargetLocationRepositoryImpl(datasource: mockTargetLocationDatasource);
  });

  test('Should execute getTargetLocation', () async {
    when(
      () => mockTargetLocationDatasource.getTargetLocation(),
    ).thenAnswer((_) async => Result.success(TargetLocationResponse.fromJson(testDataLocation)));

    await targetLocationRepositoryImpl.getTargetLocation();

    verify(() => mockTargetLocationDatasource.getTargetLocation()).called(1);
  });

  test('Should return failure if datasource fails', () async {
    when(
      () => mockTargetLocationDatasource.getTargetLocation(),
    ).thenAnswer((_) async => Result.failure(NetworkError()));

    final result = await targetLocationRepositoryImpl.getTargetLocation();

    expect(result.isFailure, true);
  });
}
