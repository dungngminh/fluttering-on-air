import 'package:flutter/material.dart';
import 'package:flutter_training_mid/src/business/dog_provider.dart';
import 'package:flutter_training_mid/src/data/model/dog/dog.dart';
import 'package:flutter_training_mid/src/injector.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DogProvider dogProvider;

  @override
  void initState() {
    dogProvider = injector<DogProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Status>(
          valueListenable: dogProvider.status,
          builder: (context, status, child) {
            if (status == Status.loading) {
              return const CircularProgressIndicator();
            } else if (status == Status.error) {
              return const Center(
                child: Icon(Icons.error),
              );
            } else {
              return ValueListenableBuilder(
                valueListenable: dogProvider.listDog,
                builder: (context, List<Dog> listDog, child) {
                  return ListView.builder(
                    itemCount: listDog.length,
                    itemBuilder: (context, index) {
                      return Text(listDog[index].name!);
                    },
                  );
                },
              );
            }
          }),
    );
  }
}
