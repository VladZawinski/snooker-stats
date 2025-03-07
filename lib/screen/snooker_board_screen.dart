
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:snooker_stat/components/snooker_balls.dart';
import 'package:snooker_stat/di/inject.dart';
import 'package:snooker_stat/model/player.dart';
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
      body: Observer(
        builder: (context) {
          final players = snookerBoardStore.snookerGame.players;
          final currentPlayer = snookerBoardStore.snookerGame.currentPlayer;
          final remainingRed = snookerBoardStore.snookerGame.remainingRedBall;
          final isRedTurn = snookerBoardStore.snookerGame.isRedTurn;
          return Column(
            children: [
              Column(
                children: players.map((p) => _PlayerCard(player: p, isTurn: currentPlayer.uuid == p.uuid,)).toList(),
              ),
              SnookerBalls(
                remainingRedCount: remainingRed,
                isRedTurn: isRedTurn,
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
          );
        },
      ),
    );
  }
}

class _PlayerCard extends StatelessWidget {
  final Player player;
  final bool isTurn;

  _PlayerCard({
    Key? key,
    required this.player,
    required this.isTurn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isTurn ? Colors.red : Colors.transparent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (isTurn)
              const Icon(
                Icons.arrow_forward,
                color: Colors.green,
              ),
            const SizedBox(width: 8),
            Text(
              player.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('${player.score}')
          ],
        ),
      ),
    );
  }
}
