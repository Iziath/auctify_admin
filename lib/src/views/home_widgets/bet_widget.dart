import 'package:flutter/material.dart';
import '../../utils/consts.dart';

class BetToMax extends StatefulWidget {
  const BetToMax({super.key});

  @override
  State<BetToMax> createState() => _BetToMaxState();
}

class _BetToMaxState extends State<BetToMax> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Bet To Max",
        style: Consts.titleStyle,
      )),
    );
  }
}
