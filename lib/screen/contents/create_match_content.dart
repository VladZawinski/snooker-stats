
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:snooker_stat/components/counter_button.dart';
import 'package:snooker_stat/store/create_match_store.dart';

class CreateMatchContent extends StatelessWidget {
  final CreateMatchStore createMatchStore;
  const CreateMatchContent({required this.createMatchStore, super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final numOfReds = createMatchStore.numberOfRed;
        final handicapOne = createMatchStore.playerOneHandicap;
        final handicapTwo = createMatchStore.playerTwoHandicap;
        return Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('How many reds?'),
                  CounterButton(
                    initialCount: numOfReds,
                    onIncrement: (val) => createMatchStore.saveNumberOfRed(val),
                    onDecrement: (val) => createMatchStore.saveNumberOfRed(val),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8 ),
                    child: Divider(),
                  ),
                  Text('Handicap'),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Player 1'),
                      CounterButton(
                        initialCount: handicapOne,
                        onIncrement: (val) => createMatchStore.savePlayerOneHandicap(val),
                        onDecrement: (val) => createMatchStore.savePlayerTwoHandicap(val),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Player 2'),
                      CounterButton(
                        initialCount: handicapTwo,
                        onIncrement: (val) => createMatchStore.savePlayerTwoHandicap(val),
                        onDecrement: (val) => createMatchStore.savePlayerTwoHandicap(val),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
