import 'package:equatable/equatable.dart';

class TargetLocationEntity extends Equatable {
  final String id;
  final double targetLng;
  final double targetLat;

  const TargetLocationEntity({required this.id, required this.targetLng, required this.targetLat});

  @override
  List<Object?> get props => [id, targetLat, targetLng];
}
