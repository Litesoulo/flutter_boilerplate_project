import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../constants/app_theme.dart';
import '../di/service_locator.dart';
import '../generated/strings.g.dart';
import '../utils/routes/routes.dart';
import 'home/store/language/language_store.dart';
import 'home/store/theme/theme_store.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
  MyApp({super.key});

  final ThemeStore _themeStore = getIt<ThemeStore>();
  final LanguageStore _languageStore = getIt<LanguageStore>();
  // final UserStore _userStore = getIt<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return TranslationProvider(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: _themeStore.darkMode ? AppThemeData.darkThemeData : AppThemeData.lightThemeData,

            // TODO ADD AUTO_ROUTE
            routes: Routes.routes,
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
