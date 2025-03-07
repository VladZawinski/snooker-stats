import 'package:flutter/material.dart';
import 'package:snooker_stat/di/inject.dart';
import 'package:snooker_stat/screen/snooker_board_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerAndOpenBoxes();
  await injectDependencies();
  runApp(const MyApp());
}

Future registerAndOpenBoxes() async {
  // Hive.registerAdapter(QuestionEntityAdapter());
  // await Hive.openBox<List>("book_audio");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snooker Stats',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SnookerBoardScreen(),
    );
  }
}
