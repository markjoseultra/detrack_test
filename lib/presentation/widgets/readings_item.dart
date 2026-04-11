import 'package:detrack_test/core/resources/values/strings.dart';
import 'package:detrack_test/core/resources/values/themes/text_theme.dart';
import 'package:detrack_test/core/utils/formatters/datetime_formatting.dart';
import 'package:flutter/material.dart';

class ReadingsItem extends StatelessWidget {
  final double lat;
  final double lng;
  final double distance;
  final DateTime timestamp;

  const ReadingsItem({
    super.key,
    required this.lat,
    required this.lng,
    required this.distance,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(DateTimeFormatting.dMMMyyyyhmmssa.format(timestamp)),
            Text('$lng, $lat', style: bodyBold12),
            Text(Strings.kmFromTheTarget(distance)),
          ],
        ),
      ),
    );
  }
}
