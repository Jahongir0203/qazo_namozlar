import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'otp_event.dart';

part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final TextEditingController controller = TextEditingController();

  OtpBloc() : super(OtpInitial()) {
    on<OtpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
