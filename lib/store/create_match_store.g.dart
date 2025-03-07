// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_match_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateMatchStore on _CreateMatchStoreBase, Store {
  late final _$playersAtom =
      Atom(name: '_CreateMatchStoreBase.players', context: context);

  @override
  ObservableList<Player> get players {
    _$playersAtom.reportRead();
    return super.players;
  }

  @override
  set players(ObservableList<Player> value) {
    _$playersAtom.reportWrite(value, super.players, () {
      super.players = value;
    });
  }

  late final _$numberOfRedAtom =
      Atom(name: '_CreateMatchStoreBase.numberOfRed', context: context);

  @override
  int get numberOfRed {
    _$numberOfRedAtom.reportRead();
    return super.numberOfRed;
  }

  @override
  set numberOfRed(int value) {
    _$numberOfRedAtom.reportWrite(value, super.numberOfRed, () {
      super.numberOfRed = value;
    });
  }

  late final _$playerOneHandicapAtom =
      Atom(name: '_CreateMatchStoreBase.playerOneHandicap', context: context);

  @override
  int get playerOneHandicap {
    _$playerOneHandicapAtom.reportRead();
    return super.playerOneHandicap;
  }

  @override
  set playerOneHandicap(int value) {
    _$playerOneHandicapAtom.reportWrite(value, super.playerOneHandicap, () {
      super.playerOneHandicap = value;
    });
  }

  late final _$playerTwoHandicapAtom =
      Atom(name: '_CreateMatchStoreBase.playerTwoHandicap', context: context);

  @override
  int get playerTwoHandicap {
    _$playerTwoHandicapAtom.reportRead();
    return super.playerTwoHandicap;
  }

  @override
  set playerTwoHandicap(int value) {
    _$playerTwoHandicapAtom.reportWrite(value, super.playerTwoHandicap, () {
      super.playerTwoHandicap = value;
    });
  }

  late final _$playerToBreakFirstAtom =
      Atom(name: '_CreateMatchStoreBase.playerToBreakFirst', context: context);

  @override
  Player? get playerToBreakFirst {
    _$playerToBreakFirstAtom.reportRead();
    return super.playerToBreakFirst;
  }

  @override
  set playerToBreakFirst(Player? value) {
    _$playerToBreakFirstAtom.reportWrite(value, super.playerToBreakFirst, () {
      super.playerToBreakFirst = value;
    });
  }

  late final _$fetchPlayersAsyncAction =
      AsyncAction('_CreateMatchStoreBase.fetchPlayers', context: context);

  @override
  Future<dynamic> fetchPlayers() {
    return _$fetchPlayersAsyncAction.run(() => super.fetchPlayers());
  }

  late final _$savePlayerAsyncAction =
      AsyncAction('_CreateMatchStoreBase.savePlayer', context: context);

  @override
  Future<dynamic> savePlayer(String name) {
    return _$savePlayerAsyncAction.run(() => super.savePlayer(name));
  }

  late final _$selectPlayerAsyncAction =
      AsyncAction('_CreateMatchStoreBase.selectPlayer', context: context);

  @override
  Future<dynamic> selectPlayer(String uuid) {
    return _$selectPlayerAsyncAction.run(() => super.selectPlayer(uuid));
  }

  late final _$_CreateMatchStoreBaseActionController =
      ActionController(name: '_CreateMatchStoreBase', context: context);

  @override
  void selectPlayerToBreakFirst(Player player) {
    final _$actionInfo = _$_CreateMatchStoreBaseActionController.startAction(
        name: '_CreateMatchStoreBase.selectPlayerToBreakFirst');
    try {
      return super.selectPlayerToBreakFirst(player);
    } finally {
      _$_CreateMatchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveNumberOfRed(int numberOfRed) {
    final _$actionInfo = _$_CreateMatchStoreBaseActionController.startAction(
        name: '_CreateMatchStoreBase.saveNumberOfRed');
    try {
      return super.saveNumberOfRed(numberOfRed);
    } finally {
      _$_CreateMatchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void savePlayerOneHandicap(int handicap) {
    final _$actionInfo = _$_CreateMatchStoreBaseActionController.startAction(
        name: '_CreateMatchStoreBase.savePlayerOneHandicap');
    try {
      return super.savePlayerOneHandicap(handicap);
    } finally {
      _$_CreateMatchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void savePlayerTwoHandicap(int handicap) {
    final _$actionInfo = _$_CreateMatchStoreBaseActionController.startAction(
        name: '_CreateMatchStoreBase.savePlayerTwoHandicap');
    try {
      return super.savePlayerTwoHandicap(handicap);
    } finally {
      _$_CreateMatchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
players: ${players},
numberOfRed: ${numberOfRed},
playerOneHandicap: ${playerOneHandicap},
playerTwoHandicap: ${playerTwoHandicap},
playerToBreakFirst: ${playerToBreakFirst}
    ''';
  }
}
