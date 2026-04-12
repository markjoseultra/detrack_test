import 'package:detrack_test/core/services/app_database/app_database.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DbModule {
  @lazySingleton
  AppDatabase get db => AppDatabase();
}
