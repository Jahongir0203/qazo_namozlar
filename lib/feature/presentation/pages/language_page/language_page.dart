import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qazo_namozlar/core/theme/app_svg.dart';
import 'package:qazo_namozlar/core/theme/theme.dart';
import 'package:qazo_namozlar/core/utils/app_locale_keys.dart';
import 'package:qazo_namozlar/feature/presentation/pages/language_page/widget/language_container_widget.dart';

import '../../../../core/utils/app_utils.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  static const route = '/lang';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppUtils.kPaddingHor20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppUtils.kSizedBoxH80,
            SvgPicture.asset(AppSvg.icMainDark),
            const Text(
              AppLocaleKeys.selectLang,
              style: AppTextStyle.w600H20,
            ),
            const Column(
              children: [
                LanguageContainer(
                  image: AppSvg.icUz,
                  text: AppLocaleKeys.uz,
                ),
                AppUtils.kDivider,
                LanguageContainer(
                  image: AppSvg.icUz,
                  text: AppLocaleKeys.uzRu,
                ),
                AppUtils.kDivider,
                LanguageContainer(
                  image: AppSvg.icRu,
                  text: AppLocaleKeys.ru,
                ),
                AppUtils.kDivider,
              ],
            ),
            AppUtils.kSizedBoxH80,
          ],
        ),
      ),
    );
  }
}
