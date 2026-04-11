import 'package:detrack_test/data/models/responses/location_collection_response/location_collection_response.dart';

abstract interface class LocationCollectionsDatasource {
  Future<List<LocationCollectionResponse>> getLocationCollections({required int numberOfReadings});
  Future<LocationCollectionResponse> saveLocation({required double lng, required double lat, required double distance});
}
