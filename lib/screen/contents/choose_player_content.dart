
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:snooker_stat/model/player.dart';
import 'package:snooker_stat/store/create_match_store.dart';

class ChoosePlayerContent extends StatelessWidget {
  VoidCallback onAddPlayer;
  CreateMatchStore createMatchStore;
  ChoosePlayerContent({required this.onAddPlayer, required this.createMatchStore, super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final players = createMatchStore.players;
        return Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: players.map((p) => _ChoosePlayerCard(player: p, onTap: () {
                      createMatchStore.selectPlayer(p.uuid);
                    })).toList(),
                  ),
                  GestureDetector(
                    onTap: onAddPlayer,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add),
                            Text('Add Player')
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
        );
      },
    );
  }
}


class _ChoosePlayerCard extends StatelessWidget {
  final Player player;
  final VoidCallback onTap;

  _ChoosePlayerCard({
    Key? key,
    required this.player,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: player.isSelected ? Colors.red : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              if (player.isSelected)
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  player.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
