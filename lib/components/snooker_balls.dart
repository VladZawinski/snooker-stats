
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnookerBalls extends StatelessWidget {
  final int remainingRedCount;
  final bool isRedTurn;
  const SnookerBalls({required this.remainingRedCount, required this.isRedTurn, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildBallRow(
            colors: [
              Colors.red,
              Colors.yellow,
              Colors.green,
              Colors.brown,
            ],
            redCount: remainingRedCount,
            isRedTurn: isRedTurn
          ),
          const SizedBox(height: 20),
          _buildBallRow(
            colors: [
              Colors.blue,
              Colors.pink,
              Colors.black,
            ],
            redCount: remainingRedCount,
            isRedTurn: isRedTurn
          ),
        ],
    );
  }
  Widget _buildBallRow({required List<Color> colors, required int redCount, required isRedTurn}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: colors.map((color) {
        final adjustedColor = isRedTurn
            ? (color == Colors.red ? color.withOpacity(1.0) : color.withOpacity(0.5))
            : (color == Colors.red ? color.withOpacity(0.5) : color.withOpacity(1.0));
        return Container(
          margin: const EdgeInsets.all(4),
          width: 50,
          height: 50,
          child: Stack(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: adjustedColor,
                ),
              ),
              _buildBallCount(color, redCount),
            ],
          ),
        );
      }).toList(),
    );
  }
  Widget _buildBallCount(Color color, int count) {
    return Center(
      child: Visibility(
        visible: color == Colors.red && count > 0,
        child: Text(
          count.toString(),
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
