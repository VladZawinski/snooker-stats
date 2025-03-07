// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snooker_board_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SnookerBoardStore on _SnookerBoardStoreBase, Store {
  late final _$snookerGameAtom =
      Atom(name: '_SnookerBoardStoreBase.snookerGame', context: context);

  @override
  SnookerGame get snookerGame {
    _$snookerGameAtom.reportRead();
    return super.snookerGame;
  }

  bool _snookerGameIsInitialized = false;

  @override
  set snookerGame(SnookerGame value) {
    _$snookerGameAtom.reportWrite(
        value, _snookerGameIsInitialized ? super.snookerGame : null, () {
      super.snookerGame = value;
      _snookerGameIsInitialized = true;
    });
  }

  late final _$createGameAsyncAction =
      AsyncAction('_SnookerBoardStoreBase.createGame', context: context);

  @override
  Future<dynamic> createGame(List<Player> players, int numberOfRed) {
    return _$createGameAsyncAction
        .run(() => super.createGame(players, numberOfRed));
  }

  late final _$potBallAsyncAction =
      AsyncAction('_SnookerBoardStoreBase.potBall', context: context);

  @override
  Future<dynamic> potBall(String ball) {
    return _$potBallAsyncAction.run(() => super.potBall(ball));
  }

  @override
  String toString() {
    return '''
snookerGame: ${snookerGame}
    ''';
  }
}
