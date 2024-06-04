import 'package:boilerplate/src/di/service_locator.dart';
import 'package:talker_flutter/talker_flutter.dart';

mixin HelperModule {
  static Future<void> configureHelperModuleInjection() async {
    final talker = TalkerFlutter.init();

    sl.registerSingleton<Talker>(
      talker,
    );
  }
}
