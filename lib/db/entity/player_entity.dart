
import 'package:hive/hive.dart';

part 'player_entity.g.dart';

@HiveType(typeId: 1)
class PlayerEntity extends HiveObject {
  @HiveField(0)
  String? uuid;
  @HiveField(1)
  String? name;

  PlayerEntity({
    required this.uuid,
    required this.name,
  });
}