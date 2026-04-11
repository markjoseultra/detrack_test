import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final int id;
  final double lng;
  final double lat;
  final double distance;
  final DateTime timestamp;

  const LocationEntity({
    required this.id,
    required this.lng,
    required this.lat,
    required this.distance,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [id, lng, lat, distance, timestamp];
}
