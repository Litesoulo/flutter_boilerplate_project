import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../di/service_locator.dart';
import '../../sharedpref/shared_preference_helper.dart';

mixin LocalModule {
  static Future<void> configureLocalModuleInjection() async {
    // preference manager:------------------------------------------------------
    sl.registerSingletonAsync<SharedPreferences>(SharedPreferences.getInstance);
    sl.registerSingleton<SharedPreferenceHelper>(
      SharedPreferenceHelper(await sl.getAsync<SharedPreferences>()),
    );

    // database:----------------------------------------------------------------
    // TODO Register drift

    // data sources:------------------------------------------------------------
    // TODO Register data sourcesP
  }
}
