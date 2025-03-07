
class Player {
  final String uuid;
  final String name;
  int score;
  final bool isSelected;

  Player(this.uuid, this.name, {this.score = 0, this.isSelected = false});
}
