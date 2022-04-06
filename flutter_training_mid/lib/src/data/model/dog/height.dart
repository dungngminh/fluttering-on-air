import 'package:hive_flutter/adapters.dart';

part 'height.g.dart';

@HiveType(typeId: 1)
class Height {
  @HiveField(0)
  String? imperial;
  @HiveField(1)
  String? metric;

  Height({this.imperial, this.metric});

  @override
  String toString() => 'Height(imperial: $imperial, metric: $metric)';

  factory Height.fromJson(Map<String, dynamic> json) => Height(
        imperial: json['imperial'] as String?,
        metric: json['metric'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'imperial': imperial,
        'metric': metric,
      };
}
