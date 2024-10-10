import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qazo_namozlar/core/extentions/padding_extension.dart';
import 'package:qazo_namozlar/core/theme/app_colors.dart';
import 'package:qazo_namozlar/core/theme/app_svg.dart';
import 'package:qazo_namozlar/feature/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:qazo_namozlar/feature/presentation/pages/otp_page/otp_page.dart';
import 'package:qazo_namozlar/feature/presentation/pages/sign_up_page/widget/sign_up_log_in_text.dart';
import 'package:qazo_namozlar/feature/presentation/pages/sign_up_page/widget/sign_up_or_row.dart';
import 'package:qazo_namozlar/feature/presentation/pages/sign_up_page/widget/sign_up_social_media_button.dart';
import 'package:qazo_namozlar/feature/presentation/pages/splash_page/splash_page.dart';
import 'package:qazo_namozlar/feature/presentation/widgets/app_custom_button.dart';
import 'package:qazo_namozlar/feature/presentation/widgets/app_widgets.dart';
import 'package:qazo_namozlar/generated/locale_keys.g.dart';

import '../../../../injection_container.dart';
import '../../widgets/app_text_from_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final bloc = sl<SignUpBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          bloc..add(SignUpLoadedEvent(isVisible: false, isAvailable: false)),
      child: BlocBuilder<SignUpBloc, SignUpState>(
        bloc: bloc,
        builder: (context, state) {
          return state is SignUpInitialState
              ? Container(
                  color: AppColors.backgroundColor,
                  child: SafeArea(
                    child: Scaffold(
                      backgroundColor: AppColors.backgroundColor,
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppWidgets.textLocale(
                                text: LocaleKeys.register,
                                fontWeight: FontWeight.w600,
                                color: AppColors.dark,
                                fontSize: 18.sp,
                              ),
                              AppWidgets.imageSvg(
                                path: AppSvg.icStar,
                                height: 35,
                                width: 35,
                              )
                            ],
                          ).paddingOnly(
                            bottom: 60.h,
                          ),
                          Text(
                            LocaleKeys.phoneNumber.tr(),
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          AppTextFormField(
                            error: state.errorMessage != ''
                                ? state.errorMessage
                                : null,
                            onTab: (value) {
                              String? error = _validateInputPhone(value);

                              bloc.add(
                                SignUpLoadedEvent(
                                    isVisible: state.isVisible,
                                    isAvailable: state.isAvailable,
                                    passwordError: state.passwordError,
                                    error: error),
                              );
                            },
                            prefixIconPath: AppSvg.icPhone,
                            isVisible: false,
                            hintText: LocaleKeys.enterPhone.tr(),
                            keyBoardType: TextInputType.phone,
                            controller: bloc.phoneController,
                            textInputFormatter: bloc.maskFormatter,
                          ),
                          Text(
                            LocaleKeys.createPassword.tr(),
                            style: Theme.of(context).textTheme.labelSmall,
                          ).paddingOnly(top: 20.h),
                          AppTextFormField(
                            canCopy: false,
                            onTab: (value) {
                              String? error = _validateInputPassword(value);
                              bloc.add(
                                SignUpLoadedEvent(
                                  isAvailable: state.isVisible,
                                  isVisible: state.isVisible,
                                  error: state.errorMessage,
                                  passwordError: error,
                                ),
                              );
                            },
                            validate: (value) {},
                            error: state.passwordError != ''
                                ? state.passwordError
                                : null,
                            prefixIconPath: AppSvg.icLock,
                            suffixIcon: IconButton(
                              onPressed: () {
                                bloc.add(SignUpLoadedEvent(
                                    isVisible: !state.isVisible,
                                    isAvailable: state.isAvailable));
                              },
                              icon: Icon(state.isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            isVisible: !state.isVisible,
                            hintText: LocaleKeys.createPassword.tr(),
                            keyBoardType: TextInputType.visiblePassword,
                            controller: bloc.passwordController,
                          ).paddingOnly(bottom: 35.h),
                          AppButton(
                            onTap: () {
                              state.errorMessage == null &&
                                      state.passwordError == null
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OtpPage(
                                            phoneNumber:
                                                bloc.phoneController.text),
                                      ),
                                    )
                                  : null;
                            },
                            color: state.errorMessage == null &&
                                    state.passwordError == null
                                ? AppColors.mainColor
                                : AppColors.sendButton,
                            text: LocaleKeys.send.tr(),
                          ),
                          const SignUpOrRow().paddingSymmetric(vertical: 35.h),
                          SocailMediaRow(
                            googleOnTap: () {},
                            facebookOnTap: () {},
                          ).paddingOnly(bottom: 35.h),
                          SignUpLogInText(onTap: () {}),
                        ],
                      ).paddingSymmetric(horizontal: 20.w, vertical: 40.h),
                    ),
                  ),
                )
              : const CircularProgressIndicator();
        },
      ),
    );
  }

  String? _validateInputPhone(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.plsEnterPhone.tr();
    }
    if (value.length < 17) {
      return LocaleKeys.plsEnterFullPhone.tr();
    }
    String code = value.substring(5, 7);
    if (![
      '20',
      '33',
      '55',
      '71',
      '77',
      '88',
      '90',
      '91',
      '93',
      '94',
      '95',
      '97',
      '98',
      '99'
    ].contains(code)) {
      return LocaleKeys.invalidOperator.tr();
    }
    return null;
  }

  String? _validateInputPassword(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.plsEnterFullPassword.tr();
    }
    if (value.length < 6) {
      return LocaleKeys.plsEnterFullPassword.tr();
    }

    return null;
  }
}
