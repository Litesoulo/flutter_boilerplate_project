import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'generated/strings.g.dart';
import 'src/di/service_locator.dart';
import 'src/presentation/application.dart';

Future<void> main() async => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();

        await setPreferredOrientations();

        await ServiceLocator.configureDependencies();

        runApp(
          TranslationProvider(
            child: Application(),
          ),
        );
      },
      (error, stack) => sl<Talker>().critical(
        'Failed to launch app...',
        error,
        stack,
      ),
    );

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}
