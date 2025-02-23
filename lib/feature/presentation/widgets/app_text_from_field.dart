import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qazo_namozlar/core/extentions/padding_extension.dart';
import 'package:qazo_namozlar/core/theme/theme.dart';

import 'app_widgets.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    required this.isVisible,
    required this.controller,
    required this.keyBoardType,
    required this.prefixIconPath,
    this.textInputFormatter,
    required this.onTab,
    this.validate, this.error, this.canCopy,
  });

  final String hintText;
  final Widget? suffixIcon;
  final bool isVisible;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final String prefixIconPath;
  final TextInputFormatter? textInputFormatter;
  final String? error;
  final bool? canCopy;
  final onTab;
  final validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.titleSmall,
      inputFormatters: textInputFormatter == null
          ? null
          : [
              textInputFormatter!,
            ],
      controller: controller,
      obscureText: isVisible,
      textAlign: TextAlign.start,
      keyboardType: keyBoardType,
      textAlignVertical: TextAlignVertical.center,
      onChanged: onTab,
      validator: validate,
      enableInteractiveSelection: canCopy?? true,
      decoration: InputDecoration(
        border: Theme.of(context).inputDecorationTheme.border,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        filled: Theme.of(context).inputDecorationTheme.filled,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        contentPadding: Theme.of(context).inputDecorationTheme.contentPadding,
        labelStyle: Theme.of(context).textTheme.labelSmall,
        hintStyle: Theme.of(context).textTheme.labelMedium,
        errorText: error,
        suffixIconColor: AppColors.darkText,
        prefixIconColor: AppColors.dark,
        hintText: hintText,
        hintTextDirection: TextDirection.ltr,
        suffixIcon: suffixIcon ?? suffixIcon,
        prefixIcon: AppWidgets.imageSvg(
                path: prefixIconPath, height: 22, width: 22, fit: BoxFit.fill)
            .paddingAll(12.sp),
      ),
    );
  }
}
