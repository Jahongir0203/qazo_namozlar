import 'package:get_it/get_it.dart';
import 'package:qazo_namozlar/feature/presentation/bloc/on_boarding_bloc/on_boarding_bloc.dart';
import 'package:qazo_namozlar/feature/presentation/bloc/otp_bloc/otp_bloc.dart';
import 'package:qazo_namozlar/feature/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:qazo_namozlar/feature/presentation/bloc/splash_bloc/splash_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerSingleton<SplashBloc>(SplashBloc());
  sl.registerSingleton<OnBoardingBloc>(OnBoardingBloc());
  sl.registerSingleton<SignUpBloc>(SignUpBloc());
  sl.registerSingleton<OtpBloc>(OtpBloc());
}
