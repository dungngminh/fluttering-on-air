import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:training_testing/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      title: "Training App",
      home: const HomePage(),
    );
  }
}
