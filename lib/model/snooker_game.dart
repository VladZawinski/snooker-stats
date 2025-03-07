
import 'package:snooker_stat/model/player.dart';

class SnookerGame {
  bool isRedTurn = true;
  final List<String> coloredBalls = ['yellow', 'green', 'brown', 'blue', 'pink', 'black'];
  int remainingRedBall = 6;
  List<Player> players = [];
  int currentPlayerIndex = 0;
  SnookerGame(this.players, this.remainingRedBall);
  Player get currentPlayer => players[currentPlayerIndex];
  void switchPlayer() {
    currentPlayerIndex = (currentPlayerIndex + 1) % players.length;
  }
  void potBall(String ball) {
    if (ball == 'red' && isRedTurn) {
      remainingRedBall--;
      currentPlayer.score += 1;
      isRedTurn = false;
    } else if (coloredBalls.contains(ball) && !isRedTurn) {
      currentPlayer.score += _getBallValue(ball);
      isRedTurn = true;
    } else {
      throw Exception('Invalid ball potted: $ball');
    }
  }
  void applyFoul({int foulPoints = 4}) {
    final opponent = players[(currentPlayerIndex + 1) % players.length];
    opponent.score += foulPoints;
    switchPlayer();
  }
  int _getBallValue(String ball) {
    switch (ball) {
      case 'yellow':
        return 2;
      case 'green':
        return 3;
      case 'brown':
        return 4;
      case 'blue':
        return 5;
      case 'pink':
        return 6;
      case 'black':
        return 7;
      default:
        throw Exception('Invalid ball: $ball');
    }
  }
}
