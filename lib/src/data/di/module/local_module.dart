import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../di/service_locator.dart';
import '../../local/drift/database.dart';
import '../../sharedpref/shared_preference_helper.dart';

mixin LocalModule {
  static Future<void> configureLocalModuleInjection() async {
    // preference manager:------------------------------------------------------
    sl.registerSingletonAsync<SharedPreferences>(SharedPreferences.getInstance);
    sl.registerSingleton<SharedPreferenceHelper>(
      SharedPreferenceHelper(await sl.getAsync<SharedPreferences>()),
    );

    // database:----------------------------------------------------------------
    sl.registerSingleton<AppDatabase>(
      AppDatabase(),
    );

    // data sources:------------------------------------------------------------
    // TODO 2) Register local module
  }
}
