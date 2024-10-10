import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qazo_namozlar/core/extentions/padding_extension.dart';

import '../../../core/theme/app_colors.dart';
import 'app_widgets.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.text,
  });

  final VoidCallback onTap;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.all(
        Radius.circular(6.r),
      ),
      child: Container(
        width: 335.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(6.r),
          ),
        ),
        child: Center(
          child: AppWidgets.textLocale(
            text: tr(text),
            fontWeight: FontWeight.normal,
            fontSize: 17.sp,
            color: AppColors.backgroundColor,
            textAlign: TextAlign.center,
          ),
        ).paddingSymmetric(vertical: 20.h),
      ),
    );
  }
}
