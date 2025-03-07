
import 'package:flutter/material.dart';
import 'package:snooker_stat/di/inject.dart';
import 'package:snooker_stat/store/snooker_board_store.dart';

class SnookerBoardScreen extends StatelessWidget {
  final SnookerBoardStore snookerBoardStore = inject();
  SnookerBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
