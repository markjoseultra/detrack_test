import 'package:detrack_test/data/models/responses/target_location_response/target_location_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TargetLocationResponse', () {
    final result = TargetLocationResponse(id: '1', target_lat: 1.0, target_lng: 1.0);

    expect(result, isA<TargetLocationResponse>());
  });
}
