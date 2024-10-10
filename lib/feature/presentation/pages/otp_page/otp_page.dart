import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:qazo_namozlar/core/extentions/padding_extension.dart';
import 'package:qazo_namozlar/core/theme/app_colors.dart';
import 'package:qazo_namozlar/feature/presentation/bloc/otp_bloc/otp_bloc.dart';
import 'package:qazo_namozlar/feature/presentation/pages/otp_page/widget/widget/pin_put_widget.dart';
import 'package:qazo_namozlar/feature/presentation/widgets/app_custom_button.dart';
import 'package:qazo_namozlar/generated/locale_keys.g.dart';

import '../../../../injection_container.dart';
import '../../widgets/app_custom_app_bar.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  int totalTimeInSeconds = 120;

  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (totalTimeInSeconds > 0) {
        setState(() {
          totalTimeInSeconds--; // Decrease the time by 1 second
        });
      } else {
        timer.cancel(); // Stop the timer when it reaches 0
      }
    });
  }

  String formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  final bloc = sl<OtpBloc>();

  @override
  Widget build(BuildContext context) {
    String phoneNumber1 = widget.phoneNumber.replaceRange(5, 14, '** *** **');

    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<OtpBloc, OtpState>(
        bloc: bloc,
        builder: (context, state) {
          return Container(
            color: AppColors.backgroundColor,
            child: SafeArea(
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(44.h),
                  child: const OtpAppBarWidget(
                    title: LocaleKeys.numberVerify,
                  ),
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: phoneNumber1,
                        style: Theme.of(context).textTheme.titleSmall,
                        children: [
                          TextSpan(
                              text: LocaleKeys.verificationCodeSend.tr(),
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ).paddingOnly(top: 30.h, bottom: 40.h),
                    Center(
                        child: PinputExample(
                      pinController: bloc.controller,
                    )),
                    RichText(
                      text: TextSpan(
                        text: LocaleKeys.resendCode.tr(),
                        style: Theme.of(context).textTheme.displaySmall,
                        children: [
                          TextSpan(
                              text: formatTime(totalTimeInSeconds),
                              style: Theme.of(context).textTheme.displayMedium),
                        ],
                      ),
                    ).paddingSymmetric(vertical: 36.h),
                    AppButton(
                        onTap: () {},
                        color: bloc.controller.text.length == 4
                            ? AppColors.mainColor
                            : AppColors.inActiveColor,
                        text: LocaleKeys.logIn.tr())
                  ],
                ).paddingSymmetric(horizontal: 30.w),
              ),
            ),
          );
        },
      ),
    );
  }
}
