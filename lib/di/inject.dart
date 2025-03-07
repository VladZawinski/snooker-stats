
import 'package:get_it/get_it.dart';
import 'package:snooker_stat/store/snooker_board_store.dart';

final inject = GetIt.instance;
Future injectDependencies() async {
  _injectStores();
}

void _injectStores() {
  inject.registerSingleton(SnookerBoardStore());
}