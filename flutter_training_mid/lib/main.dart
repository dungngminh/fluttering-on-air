import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_mid/src/app.dart';
import 'package:flutter_training_mid/src/injector.dart';

Future<void> main() async {
  await initDependences();
  // runApp(const App());

  runApp(DevicePreview(
    enabled: Platform.isWindows,
    builder: (context) => const App(), // Wrap your app
  ));
}
