part of 'on_boarding_bloc.dart';

@immutable
sealed class OnBoardingState {}

final class OnBoardingInitialState extends OnBoardingState {}


final class OnBoardingSuccessState extends OnBoardingState {
  final int currentIndex;

  OnBoardingSuccessState({required this.currentIndex});
}

