import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qazo_namozlar/core/extentions/padding_extension.dart';
import 'package:qazo_namozlar/core/theme/app_colors.dart';
import 'package:qazo_namozlar/core/theme/app_png.dart';
import 'package:qazo_namozlar/feature/presentation/pages/sign_up_page/sign_up_page.dart';
import 'package:qazo_namozlar/feature/presentation/widgets/app_widgets.dart';
import 'package:qazo_namozlar/generated/locale_keys.g.dart';

import '../../../../injection_container.dart';
import '../../bloc/on_boarding_bloc/on_boarding_bloc.dart';
import '../../widgets/app_custom_button.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({super.key});

  final PageController pageController = PageController();
  final List text = [
    LocaleKeys.onBoardingText1.tr(),
    LocaleKeys.onBoardingText2.tr(),
    LocaleKeys.onBoardingText3.tr(),
  ];

  final List title = [
    LocaleKeys.onBoardingTitle1.tr(),
    LocaleKeys.onBoardingTitle2.tr(),
    LocaleKeys.onBoardingTitle3.tr(),
  ];
  final List images = [
    AppWidgets.imageAsset(path: AppPng.img, fit: BoxFit.cover),
    AppWidgets.imageAsset(path: AppPng.img1, fit: BoxFit.cover),
    AppWidgets.imageAsset(path: AppPng.img2, fit: BoxFit.cover),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.backgroundColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.backgroundColor, // status bar color
      ),
    );
    final bloc = sl<OnBoardingBloc>();
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
        bloc: bloc
          ..add(
            OnBoardingLoadedEvent(index: 0),
          ),
        builder: (context, state) {
          return Container(
            color: AppColors.backgroundColor,
            height: 100.sh,
            width: 100.sw,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: AppColors.backgroundColor,
                body: state is OnBoardingSuccessState
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 356.h,
                            width: 375.w,
                            child: PageView.builder(
                              controller: pageController,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (value) {},
                              itemBuilder: (BuildContext context, int index) {
                                return images[state.currentIndex];
                              },
                            ),
                          ),
                          DotsIndicator(
                            dotsCount: 3,
                            position: state.currentIndex,
                            decorator: DotsDecorator(
                              color: AppColors.green20,
                              activeColor: AppColors.mainColor,
                              size: const Size.square(9.0),
                              activeSize: const Size(18.0, 9.0),
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0.r),
                              ),
                            ),
                          ).paddingOnly(
                            top: 30.h,
                            bottom: 30.h,
                          ),
                          AppWidgets.textLocale(
                                  text: title[state.currentIndex],
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.onBoardingTitle,
                                  textAlign: TextAlign.center)
                              .paddingSymmetric(horizontal: 20.w),
                          AppWidgets.textLocale(
                            text: text[state.currentIndex],
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            color: AppColors.darkText,
                            maxLines: 3,
                          ).paddingOnly(
                            top: 15.h,
                            bottom: 50.h,
                            left: 20.w,
                            right: 20.w,
                          ),
                          AppButton(
                            text: LocaleKeys.register,
                            color: AppColors.mainColor,
                            onTap: () {
                              state.currentIndex == 2
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUpPage(),
                                      ),
                                    )
                                  : null;
                              state.currentIndex <= 1
                                  ? bloc.add(OnBoardingLoadedEvent(
                                      index: state.currentIndex + 1))
                                  : null;
                            },
                          ),
                        ],
                      )
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
