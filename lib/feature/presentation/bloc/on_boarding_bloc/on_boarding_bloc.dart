import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'on_boarding_event.dart';

part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(OnBoardingInitialState()) {
    on<OnBoardingLoadedEvent>((event, emit) {
      emit(
        OnBoardingSuccessState(currentIndex: event.index),
      );
    });
  }
}
