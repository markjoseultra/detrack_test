import 'package:detrack_test/data/models/responses/location_collection_response/location_collection_response.dart';

final class TestData {
  const TestData._();

  static final locationCollectionResponse = LocationCollectionResponse(
    id: 1,
    lat: 1.0,
    lng: 1.0,
    timestamp: DateTime(1970, 1, 1),
    distance: 1.0,
  );
}
