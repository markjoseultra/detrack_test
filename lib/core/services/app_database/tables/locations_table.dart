import 'package:drift/drift.dart';

class LocationsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get latitude => real().named('latitude')();
  RealColumn get longitude => real().named('longitude')();
  RealColumn get distance => real().named('distance')();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
}
