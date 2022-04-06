import 'package:flutter/material.dart';
import 'package:flutter_provider_unlock/src/view/main_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter Provider Unlock",
      home: MainScreen(),
    );
  }
}
