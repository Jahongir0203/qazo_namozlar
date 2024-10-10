import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qazo_namozlar/core/extentions/padding_extension.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_svg.dart';
import '../../../../../core/utils/app_locale_keys.dart';
import '../../../widgets/app_widgets.dart';

class SocailMediaRow extends StatelessWidget {
  const SocailMediaRow({
    super.key,
    required this.googleOnTap,
    required this.facebookOnTap,
  });

  final VoidCallback googleOnTap;
  final VoidCallback facebookOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSocialButton(
          path: AppSvg.icGoogle,
          text: AppLocaleKeys.google,
          onTap: googleOnTap,
        ),
        CustomSocialButton(
          path: AppSvg.icFacebook,
          text: AppLocaleKeys.facebook,
          onTap: facebookOnTap,
        ),
      ],
    );
  }
}

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
    required this.text,
    required this.path,
    required this.onTap,
  });

  final String text;
  final String path;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148.w,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        boxShadow: const [
          BoxShadow(
              color: AppColors.boxShadow,
              blurRadius: 20,
              blurStyle: BlurStyle.outer,
              offset: Offset(0, 5))
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(6.r),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppWidgets.imageSvg(
              path: path,
            ).paddingOnly(right: 15.w),
            AppWidgets.textLocale(
                text: text,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.socialMedia),
          ],
        ).paddingSymmetric(horizontal: 15.w, vertical: 15.h),
      ),
    );
  }
}
