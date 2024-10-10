import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qazo_namozlar/core/router/app_routes.dart';
import 'package:qazo_namozlar/core/theme/app_colors.dart';
import 'package:qazo_namozlar/core/theme/app_theme.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  di.init();


  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('uz', 'Cyrl'),
        Locale('uz', 'UZ'),
      ],
      path: 'assets/locale',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
          child: child!,
        ),
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: Routes.splash,
      ),
    );
  }
}
