
import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  final int initialCount;
  final Function(int) onIncrement;
  final Function(int) onDecrement;

  const CounterButton({
    super.key,
    this.initialCount = 0,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = widget.initialCount;
  }

  void _decrement() {
    setState(() {
      if (_count > 0) {
        _count--;
        widget.onDecrement(_count);
      }
    });
  }

  void _increment() {
    setState(() {
      _count++;
      widget.onIncrement(_count);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: _decrement,
        ),
        Text('$_count', style: const TextStyle(fontSize: 24)),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: _increment,
        ),
      ],
    );
  }
}