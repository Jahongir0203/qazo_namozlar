import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qazo_namozlar/core/theme/app_colors.dart';
import 'package:qazo_namozlar/core/utils/app_locale_keys.dart';
import 'package:qazo_namozlar/feature/presentation/pages/on_boarding_page/on_boarding_page.dart';
import 'package:qazo_namozlar/main.dart';

import '../../../../../core/theme/app_svg.dart';
import '../../../../../core/theme/app_text_style.dart';
import '../../../../../core/utils/app_utils.dart';

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
    return Padding(
      padding: AppUtils.kPaddingHor10Ver25,
      child: GestureDetector(
        onTap: () {
          // text == AppLocaleKeys.uz
          //     ? print("UZ")
          //     : text == AppLocaleKeys.ru
          //         ? print('ru')
          //         : print('cyrl');

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
              ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(image),
            AppUtils.kSizedBoxW5,
            Text(
              text,
              style: AppTextStyle.w600H18,
            ),
          ],
        ),
      ),
    );
  }
}
