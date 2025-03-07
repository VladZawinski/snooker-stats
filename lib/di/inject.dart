
import 'package:get_it/get_it.dart';
import 'package:snooker_stat/db/datastore/player_data_store.dart';
import 'package:snooker_stat/store/create_match_store.dart';
import 'package:snooker_stat/store/snooker_board_store.dart';

final inject = GetIt.instance;
Future injectDependencies() async {
  await _injectServices();
  _injectStores();
}


Future _injectServices() async {
  inject.registerSingleton(PlayerDataStore());
}

void _injectStores() {
  inject.registerSingleton(CreateMatchStore());
  inject.registerSingleton(SnookerBoardStore());
}