import 'package:flutter/foundation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../../../core/data/network/dio/configs/dio_configs.dart';
import '../../../core/data/network/dio/dio_client.dart';
import '../../../core/data/network/dio/interceptors/auth_interceptor.dart';
import '../../../di/service_locator.dart';
import '../../network/apis/posts/post_api.dart';
import '../../network/constants/endpoints.dart';
import '../../network/interceptors/error_interceptor.dart';
import '../../sharedpref/shared_preference_helper.dart';

mixin NetworkModule {
  static Future<void> configureNetworkModuleInjection() async {
    // interceptors:------------------------------------------------------------
    sl.registerSingleton<ErrorInterceptor>(ErrorInterceptor());
    sl.registerSingleton<AuthInterceptor>(
      AuthInterceptor(
        accessToken: () async => await sl<SharedPreferenceHelper>().authToken,
      ),
    );

    // dio:---------------------------------------------------------------------
    sl.registerSingleton<DioConfigs>(
      const DioConfigs(
        baseUrl: Endpoints.baseUrl,
        connectionTimeout: Endpoints.connectionTimeout,
        receiveTimeout: Endpoints.receiveTimeout,
      ),
    );
    sl.registerSingleton<DioClient>(
      DioClient(dioConfigs: sl())
        ..addInterceptors(
          [
            sl<AuthInterceptor>(),
            sl<ErrorInterceptor>(),
            TalkerDioLogger(
              settings: const TalkerDioLoggerSettings(
                printRequestHeaders: kDebugMode,
                printResponseHeaders: kDebugMode,
                printResponseMessage: kDebugMode,
              ),
            ),
          ],
        ),
    );

    // api's:-------------------------------------------------------------------
    sl.registerSingleton(
      PostApi(sl<DioClient>()),
    );
  }
}
