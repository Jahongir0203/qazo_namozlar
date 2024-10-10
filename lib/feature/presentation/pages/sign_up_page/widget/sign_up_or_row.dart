import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qazo_namozlar/core/extentions/padding_extension.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../widgets/app_widgets.dart';

class SignUpOrRow extends StatelessWidget {
  const SignUpOrRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              thickness: 1,
              color: AppColors.darkText,
            ),
          ),
          AppWidgets.textLocale(text: LocaleKeys.or.tr())
              .paddingSymmetric(horizontal: 30.w),
          const Expanded(
            child: Divider(
              thickness: 1,
              color: AppColors.darkText,
            ),
          ),
        ],
      ),
    );
  }
}
