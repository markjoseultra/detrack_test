// coverage:ignore-file

import 'package:detrack_test/core/resources/values/strings.dart';
import 'package:detrack_test/core/utils/helpers/errors/error.dart';

class NetworkError extends CustomError {
  const NetworkError({super.message = Strings.somethingWentWrong});
}
