// coverage:ignore-file
import 'package:detrack_test/core/utils/helpers/errors/error.dart';
import 'package:equatable/equatable.dart';

/// A base class for representing the status of a state.
///
/// Useful for managing the state of a UI component, such as loading, success, or error
/// without having to create factory constructors of different states e.g:
///
/// ``` dart
/// class CheckoutSuccessState extends SuccessState {}
/// class PaymentSuccessState extends SuccessState {}
/// ```
/// Example above suggests that we can have multiple specific success states.
/// Hence we can:
/// ```dart
/// listen: (prevState, curState) {
///   if (curState is SuccessState) {
///     // Handles both CheckoutSuccessState and PaymentSuccessState
///   } else if (curState is CheckoutSuccessState) {
///     // Handles CheckoutSuccessState
///   } else if (curState is PaymentSuccessState) {
///     // Handles PaymentSuccessState
///   }
/// }
/// ```
sealed class StateStatus extends Equatable {
  const StateStatus();

  bool get isInitial => this is InitialState;
  bool get isLoading => this is LoadingState;
  bool get isSuccess => this is SuccessState;
  bool get isFailed => this is FailedState;
}

class InitialState extends StateStatus with EquatableMixin {
  const InitialState();

  @override
  List<Object?> get props => [];
}

class LoadingState extends StateStatus with EquatableMixin {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class ActiveState extends StateStatus with EquatableMixin {
  const ActiveState();

  @override
  List<Object?> get props => [];
}

class SuccessState extends StateStatus with EquatableMixin {
  const SuccessState();

  @override
  List<Object?> get props => [];
}

class FailedState extends StateStatus with EquatableMixin {
  const FailedState([this.error]);
  final CustomError? error;

  @override
  List<Object?> get props => [error];
}
