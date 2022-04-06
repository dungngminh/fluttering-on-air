import 'package:flutter_training_mid/src/business/dog_provider.dart';
import 'package:flutter_training_mid/src/data/datasource/api_datasource.dart';
import 'package:flutter_training_mid/src/data/model/dog/dog.dart';
import 'package:flutter_training_mid/src/data/model/dog/height.dart';
import 'package:flutter_training_mid/src/data/model/dog/weight.dart';
import 'package:flutter_training_mid/src/data/repositories/dog_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';

final injector = GetIt.instance;

Future<void> initDependences() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DogAdapter());
  Hive.registerAdapter(HeightAdapter());
  Hive.registerAdapter(WeightAdapter());

  await Hive.openBox<Dog>('dogList');

  injector
    ..registerLazySingleton<Client>(() => Client())
    ..registerLazySingleton<Apidatasource>(() => Apidatasource(injector()))
    ..registerLazySingleton<DogRepository>(
        () => DogRepository(apidatasource: injector()))
    ..registerFactory<DogProvider>(
        () => DogProvider(dogRepository: injector()));
}
