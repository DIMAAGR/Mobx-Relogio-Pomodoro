import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  // VARIAVEIS
  final void Function() onTap;
  final Widget? child;
  final Color? color;
  // CONSTRUTOR
  const CircularButton({
    Key? key,
    required this.onTap,
    this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: color == null ? Color.fromARGB(255, 250, 250, 250) : color,
            borderRadius: BorderRadius.circular(40)),
        child: child,
      ),
    );
  }
}
