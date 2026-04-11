// coverage:ignore-file

import 'package:detrack_test/core/resources/values/strings.dart';
import 'package:detrack_test/core/utils/helpers/errors/error.dart';

class LocationError extends CustomError {
  const LocationError({super.message = Strings.somethingWentWrong});
}

class LocationServiceDisabledError extends LocationError {}

class LocationPermissionDeniedError extends LocationError {}

class LocationPermissionDeniedForeverError extends LocationError {}
