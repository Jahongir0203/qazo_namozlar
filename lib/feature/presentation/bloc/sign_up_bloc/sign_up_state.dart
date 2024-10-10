part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitialState extends SignUpState {
  final bool isVisible;
  final bool isAvailable;
  final String? errorMessage;
  final String? passwordError;

  SignUpInitialState({this.errorMessage,
      required this.isVisible, required this.isAvailable,this.passwordError});
}

// final class SignUpLoadingState extends SignUpState {}

// final class SignUpSuccessState extends SignUpState {
//   final bool isVisible;
//   final bool isAvailable;
//
//   SignUpSuccessState({required this.isVisible, required this.isAvailable});
// }

// final class SignUpFailureState extends SignUpState {}
