import 'package:detrack_test/core/di/di.dart';
import 'package:detrack_test/domain/repositories/device_location_repository.dart';
import 'package:detrack_test/domain/repositories/target_location_repository.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Page')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await getIt<TargetLocationRepository>().getTargetLocation();
            },
            child: Text('Test'),
          ),
          ElevatedButton(
            onPressed: () async {
              await getIt<DeviceLocationRepository>().saveDeviceLocation(lng: 1.0, lat: 2.0, distance: 3.0);
            },
            child: Text('Save Data'),
          ),

          ElevatedButton(
            onPressed: () async {
              await getIt<DeviceLocationRepository>().getDeviceLocationHistory(numberOfReadings: 100);
            },
            child: Text('Get Data'),
          ),
        ],
      ),
    );
  }
}
