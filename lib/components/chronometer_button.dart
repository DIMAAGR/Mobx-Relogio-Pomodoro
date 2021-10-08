import 'package:flutter/material.dart';
import 'package:mobx_relogio_pomodoro/components/circularButton.dart';

class ChronometerButton extends StatelessWidget {
  final bool hasStarted;

  const ChronometerButton({
    Key? key,
    required this.hasStarted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hasStarted
        ? CircularButton(
            onTap: () {
              print("Hello!");
            },
            child: Icon(
              Icons.stop,
              size: 24,
              color: Theme.of(context).primaryColor,
            ),
          )
        : CircularButton(
            onTap: () {
              print("Hello!");
            },
            child: Icon(
              Icons.play_arrow,
              size: 24,
              color: Theme.of(context).primaryColor,
            ),
          );
  }
}
