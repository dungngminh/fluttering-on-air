import 'package:hive_flutter/adapters.dart';

import 'height.dart';
import 'weight.dart';

part 'dog.g.dart';

@HiveType(typeId: 0)
class Dog extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;
  
  @HiveField(2)
  String? bredFor;
  
  @HiveField(3)
  String? breedGroup;

  @HiveField(4)
  Height? height;
  
  @HiveField(5)
  String? lifeSpan;

  @HiveField(6)
  String? origin;

  @HiveField(7)
  String? temperament;

  @HiveField(8)
  Weight? weight;

  @HiveField(9)
  String? url;


  Dog({
    this.bredFor,
    this.breedGroup,
    this.height,
    this.id,
    this.lifeSpan,
    this.name,
    this.origin,
    this.temperament,
    this.weight,
    this.url,
  });

  @override
  String toString() {
    return 'Dog(bredFor: $bredFor, breedGroup: $breedGroup, height: $height, id: $id, lifeSpan: $lifeSpan, name: $name, origin: $origin, temperament: $temperament, weight: $weight, url: $url)';
  }

  factory Dog.fromJson(Map<String, dynamic> json) => Dog(
        bredFor: json['bred_for'] as String?,
        breedGroup: json['breed_group'] as String?,
        height: json['height'] == null
            ? null
            : Height.fromJson(json['height'] as Map<String, dynamic>),
        id: json['id'] as int?,
        lifeSpan: json['life_span'] as String?,
        name: json['name'] as String?,
        origin: json['origin'] as String?,
        temperament: json['temperament'] as String?,
        weight: json['weight'] == null
            ? null
            : Weight.fromJson(json['weight'] as Map<String, dynamic>),
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'bred_for': bredFor,
        'breed_group': breedGroup,
        'height': height?.toJson(),
        'id': id,
        'life_span': lifeSpan,
        'name': name,
        'origin': origin,
        'temperament': temperament,
        'weight': weight?.toJson(),
        'url': url,
      };
}
