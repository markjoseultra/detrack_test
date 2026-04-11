import 'package:detrack_test/core/services/app_database/app_database.dart';
import 'package:detrack_test/data/data_sources/location_collections_datasource.dart';
import 'package:detrack_test/data/models/responses/location_collection_response/location_collection_response.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LocationCollectionsDatasource)
class LocationsCollectionsDatasourceImpl implements LocationCollectionsDatasource {
  final db = AppDatabase();

  @override
  Future<List<LocationCollectionResponse>> getLocationCollections({required int numberOfReadings}) async {
    final items =
        await (db.select(db.locationsTable)
              ..orderBy([(t) => OrderingTerm.desc(t.timestamp)])
              ..limit(numberOfReadings))
            .get();

    return items
        .map(
          (i) => LocationCollectionResponse(
            id: i.id,
            lat: i.latitude,
            lng: i.longitude,
            timestamp: i.timestamp,
            distance: i.distance,
          ),
        )
        .toList();
  }

  @override
  Future<LocationCollectionResponse> saveLocation({
    required double lng,
    required double lat,
    required double distance,
  }) async {
    final item = await db
        .into(db.locationsTable)
        .insertReturning(
          LocationsTableCompanion(latitude: Value(lat), longitude: Value(lng), distance: Value(distance)),
        );

    return LocationCollectionResponse(
      id: item.id,
      lat: item.latitude,
      lng: item.longitude,
      timestamp: item.timestamp,
      distance: item.distance,
    );
  }
}
