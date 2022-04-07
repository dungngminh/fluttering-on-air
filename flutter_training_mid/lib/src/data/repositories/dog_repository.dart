import 'dart:convert';
import 'dart:developer';

import 'package:flutter_training_mid/src/data/datasource/api_datasource.dart';
import 'package:flutter_training_mid/src/data/model/dog/dog.dart';
import 'package:flutter_training_mid/src/utils/app_utils.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DogRepository {
  final Apidatasource apidatasource;
  DogRepository({
    required this.apidatasource,
  });

  Future<List<Dog>?> getDog({required bool willCached}) async {
    try {
      final box = Hive.box<Dog>('dogList');
      final String dataRaw = await apidatasource.getMethod();
      List<Dog> data = (jsonDecode(dataRaw) as Iterable)
          .map((e) => Dog.fromJson(e))
          .toList();
      if (willCached && box.values.isNotEmpty) {
   AppUtils.logger("Cached", location: runtimeType);
        return box.values.toList();
      } else {
        AppUtils.logger("NOT CACHED YET", location: runtimeType);
        box.addAll(data);
        return data;
      }
    } catch (e) {
      log(e.toString(), name: runtimeType.toString());
      rethrow;
    }
  }
}
