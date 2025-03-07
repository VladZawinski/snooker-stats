
import 'package:flutter/material.dart';
import 'package:snooker_stat/components/snooker_balls.dart';
import 'package:snooker_stat/di/inject.dart';
import 'package:snooker_stat/store/snooker_board_store.dart';

class SnookerBoardScreen extends StatefulWidget {
  const SnookerBoardScreen({super.key});

  @override
  State<SnookerBoardScreen> createState() => _SnookerBoardScreenState();
}

class _SnookerBoardScreenState extends State<SnookerBoardScreen> {
  final SnookerBoardStore snookerBoardStore = inject();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Scoreboard')
      ),
      body: Column(
        children: [
          SnookerBalls(
            remainingRedCount: 6,
            isRedTurn: false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Foul?')),
              SizedBox(width: 12,),
              OutlinedButton(onPressed: () {}, child: Text('No Foul')),
            ],
          )
        ],
      ),
    );
  }
}
