
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:snooker_stat/model/player.dart';
import 'package:snooker_stat/store/create_match_store.dart';

class WhoWillBreakContent extends StatelessWidget {
  final CreateMatchStore createMatchStore;
  const WhoWillBreakContent({required this.createMatchStore, super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final selectedPlayers = createMatchStore.selectedPlayers;
        final playerToBreakFirst = createMatchStore.playerToBreakFirst;
        return Column(
          children: selectedPlayers.map((p) => _ChoosePlayerCard(
              isSelected: playerToBreakFirst?.uuid == p.uuid,
              player: p,
              onTap: () => createMatchStore.selectPlayerToBreakFirst(p)
          )
          ).toList(),
        );
      },
    );
  }
}

class _ChoosePlayerCard extends StatelessWidget {
  final Player player;
  final bool isSelected;
  final VoidCallback onTap;

  _ChoosePlayerCard({
    Key? key,
    required this.isSelected,
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
            color: isSelected ? Colors.red : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              if (isSelected)
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