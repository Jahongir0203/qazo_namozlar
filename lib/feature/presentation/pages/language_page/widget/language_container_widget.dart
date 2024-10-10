import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qazo_namozlar/core/extentions/padding_extension.dart';
import 'package:qazo_namozlar/core/theme/theme.dart';
import 'package:qazo_namozlar/core/utils/app_locale_keys.dart';
import 'package:qazo_namozlar/feature/presentation/pages/on_boarding_page/on_boarding_page.dart';
import 'package:qazo_namozlar/feature/presentation/widgets/app_widgets.dart';

class LanguageContainer extends StatelessWidget {
  const LanguageContainer({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        text == AppLocaleKeys.uz
            ? context.setLocale(
                const Locale('uz', 'UZ'),
              )
            : text == AppLocaleKeys.ru
                ? context.setLocale(
                    const Locale('ru', 'RU'),
                  )
                : context.setLocale(
                    const Locale('uz', 'Cyrl'),
                  );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OnBoardingPage(),
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.dark),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppWidgets.imageSvg(
              path: image,
              height: 30.h,
              width: 30.w,
            ).paddingOnly(right: 5.w),
            AppWidgets.textLocale(
                text: text,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: AppColors.dark),
          ],
        ).paddingSymmetric(horizontal: 10.w, vertical: 25.h),
      ),
    );
  }
}
