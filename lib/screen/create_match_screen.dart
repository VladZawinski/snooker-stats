

import 'package:flutter/material.dart';
import 'package:snooker_stat/common/types.dart';
import 'package:snooker_stat/di/inject.dart';
import 'package:snooker_stat/screen/contents/choose_player_content.dart';
import 'package:snooker_stat/screen/contents/create_match_content.dart';
import 'package:snooker_stat/screen/contents/who_will_break_content.dart';
import 'package:snooker_stat/store/create_match_store.dart';

class CreateMatchScreen extends StatelessWidget {
  final CreateMatchStore _createMatchStore = inject();
  final PageController _pageController = PageController();
  CreateMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match Setup'),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          switch(index) {
            case 0: return ChoosePlayerContent(
              createMatchStore: _createMatchStore,
              onAddPlayer: () {
                showNameDialog(
                    context,
                        (name) => _createMatchStore.savePlayer(name)
                );
              },
            );
            case 1: CreateMatchContent(
              createMatchStore: _createMatchStore,
            );
            case 2: WhoWillBreakContent(
              createMatchStore: _createMatchStore,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        final index = _pageController.initialPage;
        print("index: $index");
        switch(index) {
          case 0: _pageController.jumpToPage(1);
          break;
          case 1: _pageController.jumpToPage(2);
          break;
        }
      },
      child: Text('Next'),),
    );
  }
}


void showNameDialog(
    BuildContext context,
    StringCallback onSubmitName
 ) {
  final TextEditingController nameController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Enter Your Name'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final String name = nameController.text;
              if (name.isNotEmpty) {
                onSubmitName(name);
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter a name')),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      );
    },
  );
}