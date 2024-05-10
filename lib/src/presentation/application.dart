import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../generated/strings.g.dart';
import '../core/config/theme/app_theme.dart';
import '../di/service_locator.dart';
import '../core/config/router/app_router.dart';
import 'home/store/theme/theme_store.dart';

class Application extends StatelessWidget {
  // This widget is the root of your application.
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
  Application({super.key});

  final ThemeStore _themeStore = getIt<ThemeStore>();
  // final LanguageStore _languageStore = getIt<LanguageStore>();
  // final UserStore _userStore = getIt<UserStore>();
  final AppRouter _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return TranslationProvider(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: _themeStore.darkMode ? AppThemeData.darkThemeData : AppThemeData.lightThemeData,

            // TODO ADD AUTO_ROUTE
            routerConfig: _appRouter.config(),
            // home: _userStore.isLoggedIn ? HomeScreen() : LoginScreen(),

            // TODO ADD SLANG
            // locale: Locale(_languageStore.locale),
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: const [
              // A class which loads the translations from JSON files

              // Built-in localization of basic text for Material widgets
              GlobalMaterialLocalizations.delegate,
              // Built-in localization for text direction LTR/RTL
              GlobalWidgetsLocalizations.delegate,
              // Built-in localization of basic text for Cupertino widgets
              GlobalCupertinoLocalizations.delegate,
            ],
          ),
        );
      },
    );
  }
}
