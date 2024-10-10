import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'dart:ui' as ui;

import '../../../../../../core/theme/app_colors.dart';

class PinputExample extends StatefulWidget {
  const PinputExample({Key? key, required this.pinController}) : super(key: key);
  final TextEditingController pinController;

  @override
  State<PinputExample> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinputExample> {
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;


  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    focusNode = FocusNode();

    /// In case you need an SMS autofill feature
  }

  @override
  void dispose() {
    widget.pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = AppColors.blue;
    const fillColor = AppColors.backgroundColor;
    const borderColor = AppColors.pinPutColor;

    final defaultPinTheme = PinTheme(
      width: 55,
      height: 55,
      textStyle: TextStyle(
        fontSize: 22.sp,
        color: AppColors.dark,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: borderColor),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Directionality(
            textDirection: ui.TextDirection.ltr,
            child: Pinput(
              controller: widget.pinController,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => SizedBox(width: 8.w),
              // validator: (value) {
              //   return value == '2222' ? null : 'Pin is incorrect';
              // },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 9.h),
                    width: 22.w,
                    height: 1.h,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
        ],
      ),
    ) ;
  }
}

