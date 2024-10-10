part of 'on_boarding_bloc.dart';

@immutable
sealed class OnBoardingEvent {}

class OnBoardingLoadedEvent extends OnBoardingEvent {
  final int index;

  OnBoardingLoadedEvent({required this.index});
}
