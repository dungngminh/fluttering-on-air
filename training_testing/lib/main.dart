import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:training_testing/app.dart';

void main() {
  runApp(DevicePreview(
    enabled: Platform.isLinux,
    builder: (context) {
      return const App();
    }
  ));
  // runApp(App());
}
