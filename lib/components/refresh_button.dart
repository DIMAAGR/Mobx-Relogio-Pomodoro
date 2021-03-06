import 'package:flutter/material.dart';
import 'package:mobx_relogio_pomodoro/components/circularButton.dart';

class RefreshButton extends StatelessWidget {
  final bool off;
  final Color? color;
  final void Function() onTap;
  const RefreshButton(
      {Key? key, required this.off, this.color, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !off
        ? CircularButton(
            onTap: onTap,
            child: Icon(
              Icons.replay,
              size: 24,
              color: color,
            ),
          )
        : CircularButton(
            color: Color.fromARGB(255, 210, 210, 210),
            onTap: () {},
            child: Icon(
              Icons.replay,
              size: 24,
              color: color,
            ));
  }
}
