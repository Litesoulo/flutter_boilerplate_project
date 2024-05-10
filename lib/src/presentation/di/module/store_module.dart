import 'dart:async';

import '../../../core/config/router/app_router.dart';

import '../../../core/stores/error/error_store.dart';
import '../../../core/stores/form/form_store.dart';
import '../../../di/service_locator.dart';
import '../../../domain/repository/setting/setting_repository.dart';
import '../../../domain/usecase/post/get_post_usecase.dart';
import '../../../domain/usecase/user/is_logged_in_usecase.dart';
import '../../../domain/usecase/user/login_usecase.dart';
import '../../../domain/usecase/user/save_login_in_status_usecase.dart';
import '../../home/store/language/language_store.dart';
import '../../home/store/theme/theme_store.dart';
import '../../login/store/login_store.dart';
import '../../post/store/post_store.dart';

mixin StoreModule {
  static Future<void> configureStoreModuleInjection() async {
    // router:------------------------------------------------------------------
    sl.registerSingleton<AppRouter>(
      AppRouter(),
    );

    // factories:---------------------------------------------------------------
    sl.registerFactory(() => ErrorStore());
    sl.registerFactory(() => FormErrorStore());
    sl.registerFactory(
      () => FormStore(sl<FormErrorStore>(), sl<ErrorStore>()),
    );

    // stores:------------------------------------------------------------------
    sl.registerSingleton<UserStore>(
      UserStore(
        sl<IsLoggedInUseCase>(),
        sl<SaveLoginStatusUseCase>(),
        sl<LoginUseCase>(),
        sl<FormErrorStore>(),
        sl<ErrorStore>(),
      ),
    );

    sl.registerSingleton<PostStore>(
      PostStore(
        sl<GetPostUseCase>(),
        sl<ErrorStore>(),
      ),
    );

    sl.registerSingleton<ThemeStore>(
      ThemeStore(
        sl<SettingRepository>(),
        sl<ErrorStore>(),
      ),
    );

    sl.registerSingleton<LanguageStore>(
      LanguageStore(
        sl<SettingRepository>(),
        sl<ErrorStore>(),
      ),
    );
  }
}
