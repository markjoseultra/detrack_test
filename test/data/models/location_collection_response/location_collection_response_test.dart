import 'package:detrack_test/data/models/responses/location_collection_response/location_collection_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('LocationCollectionResponse', () {
    final result = LocationCollectionResponse(id: 1, lat: 1.0, lng: 1.0, timestamp: DateTime(2026), distance: 1.0);

    expect(result, isA<LocationCollectionResponse>());
  });
}
