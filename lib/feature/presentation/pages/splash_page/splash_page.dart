import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qazo_namozlar/core/theme/theme.dart';
import 'package:qazo_namozlar/feature/presentation/pages/language_page/language_page.dart';
import 'package:qazo_namozlar/main.dart';

import '../../bloc/splash_bloc/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(SplashLoadedEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashSuccessState) {
            Navigator.pushReplacement(
              context,
              buildMaterialPageRoute(),
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 1.sh,
                width: 1.sw,
                color: AppColors.green,
                child: Center(
                  child: SvgPicture.asset(AppSvg.icMainLight),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  MaterialPageRoute<dynamic> buildMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (context) => const LanguagePage(),
    );
  }
}
