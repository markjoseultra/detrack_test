import 'package:equatable/equatable.dart';

class CurrentLocationEntity extends Equatable {
  final double lng;
  final double lat;

  const CurrentLocationEntity({required this.lng, required this.lat});

  @override
  List<Object?> get props => [lng, lat];
}
