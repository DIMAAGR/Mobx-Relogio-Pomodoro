import 'package:flutter/material.dart';
import 'package:mobx_relogio_pomodoro/components/chronometer_button.dart';
import 'package:mobx_relogio_pomodoro/components/circularbutton.dart';
import 'package:mobx_relogio_pomodoro/components/enterTime.dart';
import 'package:mobx_relogio_pomodoro/components/refresh_button.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(alignment: Alignment.center, children: [
            Container(
              height: 184,
              width: 184,
              child: CircularProgressIndicator(
                strokeWidth: 5.5,
                value: 0,
                backgroundColor: Color(0xffA20006),
                color: Color.fromARGB(255, 250, 250, 250),
              ),
            ),
            Text(
              "25:00",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 250, 250, 250),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 48.0, bottom: 92.0),
            child: Text(
              "Hora de Trabalhar!",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 250, 250, 250),
              ),
            ),
          ),
          _buttons(context),
        ],
      ),
    );
  }

  _buttons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChronometerButton(
          hasStarted: false,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: RefreshButton(
            off: true,
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
            onTap: () => showModalBottomSheet(
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
            ),
          ),
        ],
      ),
    );
  }
}
