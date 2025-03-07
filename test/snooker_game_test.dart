
import 'package:flutter_test/flutter_test.dart';
import 'package:snooker_stat/model/player.dart';
import 'package:snooker_stat/model/snooker_game.dart';

void main() {
  group('Snooker Game Test', () {
    late SnookerGame game;
    late Player player1;
    late Player player2;
    setUp(() {
      player1 = Player("Sydney Sweeney");
      player2 = Player("Vlad");
      final players = [player1, player2];
      game = SnookerGame(players, 6);
    });
    test('Pot Red Ball Test', () {
      game.potBall('red');
      expect(game.remainingRedBall, 5);
      expect(player1.score, 1);
      expect(game.isRedTurn, false);
    });
    test('Pot Colored Ball Test', () {
      game.isRedTurn = false;
      game.potBall('black');
      expect(player1.score, 7);
      expect(game.isRedTurn, true);
    });
    test('Foul Test', () {
      game.applyFoul(foulPoints: 4);
      expect(player2.score, 4);
      expect(game.currentPlayer, player2);
    });
    test('Player Switching Test', () {
      game.switchPlayer();
      expect(game.currentPlayer, player2);
      game.switchPlayer();
      expect(game.currentPlayer, player1);
    });
  });
}