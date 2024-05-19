import 'dart:async';

import '../../../core/config/router/app_router.dart';
import '../../../di/service_locator.dart';
import '../../../domain/repository/setting/setting_repository.dart';
import '../../home/store/language/language_store.dart';
import '../../home/store/theme/theme_store.dart';

mixin StoreModule {
  static Future<void> configureStoreModuleInjection() async {
    // router:------------------------------------------------------------------
    sl.registerSingleton<AppRouter>(
      AppRouter(),
    );

    // factories:---------------------------------------------------------------

    // stores:------------------------------------------------------------------
    sl.registerSingleton<ThemeStore>(
      ThemeStore(
        sl<SettingRepository>(),
      ),
    );

    sl.registerSingleton<LanguageStore>(
      LanguageStore(
        sl<SettingRepository>(),
      ),
    );
  }
}
