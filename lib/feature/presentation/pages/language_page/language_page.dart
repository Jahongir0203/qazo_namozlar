import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qazo_namozlar/core/extentions/padding_extension.dart';
import 'package:qazo_namozlar/core/theme/theme.dart';
import 'package:qazo_namozlar/core/utils/app_locale_keys.dart';
import 'package:qazo_namozlar/feature/presentation/pages/language_page/widget/language_container_widget.dart';
import 'package:qazo_namozlar/feature/presentation/widgets/app_widgets.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  static const route = '/lang';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppWidgets.imageSvg(
                  path: AppSvg.icMainDark,
                  height: 90.h,
                  width: 144.w,
                ),
                AppWidgets.textLocale(
                        text: AppLocaleKeys.selectLang,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.dark)
                    .paddingOnly(bottom: 70.h, top: 80.h),
                const Column(
                  children: [
                    LanguageContainer(
                      image: AppSvg.icUz,
                      text: AppLocaleKeys.uz,
                    ),
                    LanguageContainer(
                      image: AppSvg.icUz,
                      text: AppLocaleKeys.uzRu,
                    ),
                    LanguageContainer(
                      image: AppSvg.icRu,
                      text: AppLocaleKeys.ru,
                    ),
                  ],
                ),
              ],
            ).paddingOnly(left: 20.w, right: 20.w, top: 40.h),
          ),
        ),
      ),
    );
  }
}
