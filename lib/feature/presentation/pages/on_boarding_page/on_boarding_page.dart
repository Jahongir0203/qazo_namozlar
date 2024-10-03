import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qazo_namozlar/generated/locale_keys.g.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(LocaleKeys.register.tr()),
        )
      ],
    ));
  }
}
