import 'dart:async';

import 'package:weather_and_dress/src/core/utils/logger.dart';
import 'package:weather_and_dress/src/feature/app/logic/app_runner.dart';

void main() {
  logger.runLogging(
    () => runZonedGuarded(
      () => const AppRunner().initializeAndRun(),
      logger.logZoneError,
    ),
    const LogOptions(),
  );
}
