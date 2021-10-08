import 'package:flutter/material.dart';
import 'package:mobx_relogio_pomodoro/components/circularButton.dart';

class RefreshButton extends StatelessWidget {
  final bool off;
  const RefreshButton({Key? key, required this.off}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !off
        ? CircularButton(
            onTap: () {},
            child: Icon(
              Icons.replay,
              size: 24,
              color: Theme.of(context).primaryColor,
            ),
          )
        : CircularButton(
            color: Color.fromARGB(255, 210, 210, 210),
            onTap: () {},
            child: Icon(
              Icons.replay,
              size: 24,
              color: Theme.of(context).primaryColor,
            ));
  }
}
