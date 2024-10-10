part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class SignUpLoadedEvent extends SignUpEvent {
  final bool isVisible;
  final bool isAvailable;
  final String? error;
  final String? passwordError;

  SignUpLoadedEvent(
      {this.error,
      required this.isVisible,
      required this.isAvailable,
      this.passwordError});
}
