import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String message;

  const CustomError({required this.message});

  @override
  List<Object?> get props => [message];
}
