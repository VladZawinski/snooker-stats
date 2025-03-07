import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:snooker_stat/app_route.dart';
import 'package:snooker_stat/db/entity/player_entity.dart';
import 'package:snooker_stat/di/inject.dart';
import 'package:snooker_stat/screen/create_match_screen.dart';
import 'package:snooker_stat/screen/landing_screen.dart';
import 'package:snooker_stat/screen/snooker_board_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await registerAndOpenBoxes();
  await injectDependencies();
  runApp(const MyApp());
}

Future registerAndOpenBoxes() async {
  Hive.registerAdapter(PlayerEntityAdapter());
  await Hive.openBox<PlayerEntity>("player");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snooker Stats',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoute.landing,
      routes: {
        AppRoute.landing: (_) => LandingScreen(),
        AppRoute.create_game: (_) => CreateMatchScreen(),
        AppRoute.snooker_board: (_) => SnookerBoardScreen()
      },
    );
  }
}
