// coverage:ignore-file

import 'package:detrack_test/core/resources/values/strings.dart';
import 'package:detrack_test/core/utils/helpers/errors/error.dart';

class DefaultError extends CustomError {
  const DefaultError({super.message = Strings.somethingWentWrong});
}
