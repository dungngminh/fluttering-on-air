import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: null,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
            child: Row(
          children: [
            IconButton(
              icon: const Icon(PhosphorIcons.house),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(PhosphorIcons.house),
              onPressed: () {},
            )
          ],
        )),
      ),
    );
  }
}
