import 'package:detrack_test/core/utils/formatters/datetime_formatting.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('dMMMyyyyhmmssa should return 1 Jan 2026, 12:00:00 AM', () {
    final result = DateTimeFormatting.dMMMyyyyhmmssa.format(DateTime(2026));

    expect(result, '1 Jan 2026, 12:00:00 AM');
  });
}
