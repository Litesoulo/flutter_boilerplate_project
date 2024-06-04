import 'dart:async';

import '../../../di/service_locator.dart';
import '../../../domain/repository/setting/setting_repository.dart';
import '../../../domain/repository/user/user_repository.dart';
import '../../repository/setting/setting_repository_impl.dart';
import '../../repository/user/user_repository_impl.dart';
import '../../sharedpref/shared_preference_helper.dart';

mixin RepositoryModule {
  static Future<void> configureRepositoryModuleInjection() async {
    // repository:--------------------------------------------------------------
    sl.registerSingleton<SettingRepository>(SettingRepositoryImpl(
      sl<SharedPreferenceHelper>(),
    ));

    sl.registerSingleton<UserRepository>(UserRepositoryImpl(
      sl<SharedPreferenceHelper>(),
    ));

    // TODO 3) Register repository
  }
}
