import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HttpModule {
  @lazySingleton
  Dio get client => Dio();
}
