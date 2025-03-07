
import 'package:mobx/mobx.dart';
import 'package:snooker_stat/db/datastore/player_data_store.dart';
import 'package:snooker_stat/di/inject.dart';
import 'package:snooker_stat/model/player.dart';

part 'create_match_store.g.dart';

class CreateMatchStore = _CreateMatchStoreBase with _$CreateMatchStore;

abstract class _CreateMatchStoreBase with Store {
  final PlayerDataStore playerDataStore = inject();
  @observable
  ObservableList<Player> players = ObservableList();
  @observable
  int numberOfRed = 6;
  @observable
  int playerOneHandicap = 0;
  @observable
  int playerTwoHandicap = 0;
  @observable
  Player? playerToBreakFirst;
  _CreateMatchStoreBase() {
    fetchPlayers();
  }
  List<Player> get selectedPlayers => players.where((p) => p.isSelected).toList();
  @action Future fetchPlayers() async {
    final savedPlayers = await playerDataStore.getPlayers();
    final mappedPlayers = savedPlayers.map((p) => Player(p.uuid!, p.name!)).toList();
    players.clear();
    players.addAll(mappedPlayers);
  }
  @action Future savePlayer(String name) async {
    await playerDataStore.savePlayer(name);
    await fetchPlayers();
  }
  @action Future selectPlayer(String uuid) async {
    final index = players.indexWhere((player) => player.uuid == uuid);
    if (index != -1) {
      final player = players[index];
      final updatedPlayer = Player(
        player.uuid,
        player.name,
        score: player.score,
        isSelected: !player.isSelected,
      );
      players[index] = updatedPlayer;
    }
  }
  @action void selectPlayerToBreakFirst(Player player) {
    playerToBreakFirst = player;
  }
  @action void saveNumberOfRed(int numberOfRed) {
    this.numberOfRed = numberOfRed;
  }
  @action void savePlayerOneHandicap(int handicap) {
    playerOneHandicap = handicap;
  }
  @action void savePlayerTwoHandicap(int handicap) {
    playerTwoHandicap = handicap;
  }
}
