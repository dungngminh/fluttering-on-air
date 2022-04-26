import 'package:flutter/material.dart';
import 'package:training_testing/body_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: BodyContent());
  }
}
