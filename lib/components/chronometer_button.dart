import 'package:flutter/material.dart';
import 'package:mobx_relogio_pomodoro/components/circularButton.dart';

class ChronometerButton extends StatelessWidget {
  final bool hasStarted;
  final void Function() onTap;
  final Color? color;

  const ChronometerButton({
    Key? key,
    required this.hasStarted,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hasStarted
        ? CircularButton(
            onTap: onTap,
            child: Icon(
              Icons.stop,
              size: 24,
              color: color,
            ),
          )
        : CircularButton(
            onTap: onTap,
            child: Icon(
              Icons.play_arrow,
              size: 24,
              color: color,
            ),
          );
  }
}
