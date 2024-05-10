import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/data/local/sembast/sembast_client.dart';
import '../../../di/service_locator.dart';
import '../../local/constants/db_constants.dart';
import '../../local/datasources/post/post_datasource.dart';
import '../../sharedpref/shared_preference_helper.dart';

mixin LocalModule {
  static Future<void> configureLocalModuleInjection() async {
    // preference manager:------------------------------------------------------
    sl.registerSingletonAsync<SharedPreferences>(
        SharedPreferences.getInstance);
    sl.registerSingleton<SharedPreferenceHelper>(
      SharedPreferenceHelper(await sl.getAsync<SharedPreferences>()),
    );

    // database:----------------------------------------------------------------

    sl.registerSingletonAsync<SembastClient>(
      () async => SembastClient.provideDatabase(
        databaseName: DBConstants.DB_NAME,
        databasePath: kIsWeb
            ? '/assets/db'
            : (await getApplicationDocumentsDirectory()).path,
      ),
    );

    // data sources:------------------------------------------------------------
    sl.registerSingleton(
        PostDataSource(await sl.getAsync<SembastClient>()));
  }
}
