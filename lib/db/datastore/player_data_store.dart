
import 'package:hive_flutter/adapters.dart';
import 'package:snooker_stat/db/entity/player_entity.dart';
import 'package:uuid/uuid.dart';

class PlayerDataStore {
  final Box<PlayerEntity> _playerBox = Hive.box<PlayerEntity>('player');
  Future savePlayer(String name) async {
    final uuid = _generateUUID();
    final entity = PlayerEntity(uuid: uuid, name: name);
    await _playerBox.put(uuid, entity);
  }
  Future<List<PlayerEntity>> getPlayers() async {
    return _playerBox.values.toList();
  }
  String _generateUUID() {
    return const Uuid().v4().toString();
  }
}