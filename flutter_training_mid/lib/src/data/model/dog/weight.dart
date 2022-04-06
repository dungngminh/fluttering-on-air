import 'package:hive_flutter/hive_flutter.dart';

part 'weight.g.dart';

@HiveType(typeId: 2)
class Weight {
  @HiveField(0)
  String? imperial;
    @HiveField(1)
  String? metric;

  Weight({this.imperial, this.metric});

  @override
  String toString() => 'Weight(imperial: $imperial, metric: $metric)';

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        imperial: json['imperial'] as String?,
        metric: json['metric'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'imperial': imperial,
        'metric': metric,
      };
}
