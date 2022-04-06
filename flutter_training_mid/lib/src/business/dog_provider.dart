import 'package:flutter/foundation.dart';
import 'package:flutter_training_mid/src/data/model/dog/dog.dart';
import 'package:flutter_training_mid/src/data/repositories/dog_repository.dart';

enum Status { loading, error, idle }

class DogProvider {
  late ValueNotifier<List<Dog>> listDog;
  ValueNotifier<Status> status = ValueNotifier(Status.idle);

  final DogRepository dogRepository;
  DogProvider({
    required this.dogRepository,
  }) {
    status.value = Status.loading;
    dogRepository.getDog(willCached: true).then((dogs) {
      listDog = ValueNotifier<List<Dog>>(dogs ?? []);
      status.value = Status.idle;
    }).onError(
      (error, stackTrace) {
        listDog.value = [];
        status.value = Status.error;
      },
    );
  }
}
