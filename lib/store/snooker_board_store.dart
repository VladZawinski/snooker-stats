
import 'package:mobx/mobx.dart';
import 'package:snooker_stat/model/player.dart';
import 'package:snooker_stat/model/snooker_game.dart';

part 'snooker_board_store.g.dart';

class SnookerBoardStore = _SnookerBoardStoreBase with _$SnookerBoardStore;

abstract class _SnookerBoardStoreBase with Store {
  @observable
  late SnookerGame snookerGame;
  @action Future createGame(List<Player> players, int numberOfRed) async {
    snookerGame = SnookerGame(players, numberOfRed);
  }
  @action Future potBall(String ball) async {

  }
}
