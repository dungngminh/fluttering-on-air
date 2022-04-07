import 'package:flutter/material.dart';
import 'package:flutter_training_mid/src/data/model/dog/dog.dart';

class DetailScreen extends StatelessWidget {
  final Dog dog;
  const DetailScreen({Key? key, required this.dog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Hero(
          tag: dog.name!,
          child: CircleAvatar(
            radius: 120,
            backgroundImage: NetworkImage(dog.url!),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(dog.name!),
      ])),
    );
  }
}
