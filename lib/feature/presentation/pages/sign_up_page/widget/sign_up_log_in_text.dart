import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qazo_namozlar/core/extentions/padding_extension.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../widgets/app_widgets.dart';

class SignUpLogInText extends StatelessWidget {
  const SignUpLogInText({
    super.key, required this.onTap,
  });
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      splashColor: AppColors.grey.shade100,
      borderRadius: BorderRadius.all(
        Radius.circular(6.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppWidgets.textLocale(
              text: LocaleKeys.hasAccount,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.socialMedia),
          AppWidgets.textLocale(
                  text: LocaleKeys.logIn,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.blue)
              .paddingOnly(left: 5.w),
        ],
      ),
    );
  }
}
