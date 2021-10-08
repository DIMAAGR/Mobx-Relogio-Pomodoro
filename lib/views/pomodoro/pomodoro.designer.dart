import 'package:flutter/material.dart';
import 'package:mobx_relogio_pomodoro/components/circularbutton.dart';
import 'package:mobx_relogio_pomodoro/components/enterTime.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hora de Trabalhar!",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 32,
              color: Color.fromARGB(255, 250, 250, 250),
            ),
          ),
          EnterTime(titulo: 'Trabalho', valor: 25),
          EnterTime(titulo: 'Descanso', valor: 5),
          _buttons(context),
        ],
      ),
    );
  }

  _buttons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularButton(
          onTap: () {
            print("Hello!");
          },
          child: Icon(
            Icons.play_arrow,
            size: 24,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircularButton(
            onTap: () {},
            child: Icon(
              Icons.replay,
              size: 24,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        CircularButton(
          onTap: () => _modalBottomSheet(context),
          child: Icon(
            Icons.settings,
            size: 24,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }

  _modalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        children: [
          ListTile(
            title: Text("Trabalho"),
            trailing: Text("25" + "min"),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularButton(
                      onTap: () {
                        print("Hello!");
                      },
                      child: Icon(
                        Icons.add,
                        size: 24,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text("25min"),
                    CircularButton(
                      onTap: () {
                        print("Hello!");
                      },
                      child: Icon(
                        Icons.remove,
                        size: 24,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: Text("Descanso"),
            trailing: Text("25" + "min"),
            onTap: () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularButton(
                  onTap: () {
                    print("Hello!");
                  },
                  child: Icon(
                    Icons.add,
                    size: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text("25min"),
                CircularButton(
                  onTap: () {
                    print("Hello!");
                  },
                  child: Icon(
                    Icons.remove,
                    size: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
