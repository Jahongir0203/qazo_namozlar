import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var maskFormatter = MaskTextInputFormatter(
    mask: '+998 ## ### ## ##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  SignUpBloc()
      : super(SignUpInitialState(
            isAvailable: false, isVisible: false, errorMessage: '',passwordError: '')) {
    on<SignUpLoadedEvent>((event, emit) {
      emit(
        SignUpInitialState(
          isVisible: event.isVisible,
          isAvailable: event.isAvailable,
          errorMessage: event.error,
          passwordError: event.passwordError,
        ),
      );
    });
  }
}
