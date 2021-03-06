import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_relogio_pomodoro/components/chronometer_button.dart';
import 'package:mobx_relogio_pomodoro/components/circularbutton.dart';
import 'package:mobx_relogio_pomodoro/components/refresh_button.dart';
import 'package:mobx_relogio_pomodoro/data/data.dart';
import 'package:mobx_relogio_pomodoro/store/pomodoro.store.dart';
import 'package:mobx_relogio_pomodoro/views/pomodoro/pomodoro.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //CRIAÇÃO/INSTANCIAÇÃO DO PROVIDER
    final store = Provider.of<PomodoroStore>(context);
    final TimeData _timeData = TimeData();
    // EVENTOS/AÇÕES
    final PomodoroEvents _events = PomodoroEvents();

    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: store.estaTrabalhando()
            ? Theme.of(context).primaryColor
            : Color(0xff529300),
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
                  value: _value(store, _timeData),
                  backgroundColor: store.estaTrabalhando()
                      ? Color(0xffA20006)
                      : Color(0xff165F00),
                  color: Color.fromARGB(255, 250, 250, 250),
                ),
              ),
              Text(
                "${store.minutos.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}",
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
                store.estaTrabalhando()
                    ? "Hora de Trabalhar!"
                    : "Hora de Descansar!",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 250, 250, 250),
                ),
              ),
            ),
            _buttons(context, store, _events, _timeData),
          ],
        ),
      ),
    );
  }

  _buttons(BuildContext context, PomodoroStore provider, PomodoroEvents _events,
      TimeData _timeData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChronometerButton(
          hasStarted: provider.iniciou ? true : false,
          color: provider.estaTrabalhando()
              ? Theme.of(context).primaryColor
              : Color(0xff529300),
          onTap: () => _events.startStopEvent(provider),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: RefreshButton(
            color: provider.estaTrabalhando()
                ? Theme.of(context).primaryColor
                : Color(0xff529300),
            off: !provider.iniciou ? true : false,
            onTap: () => provider.reiniciar(),
          ),
        ),
        CircularButton(
          onTap: () => _modalBottomSheet(context, provider, _events, _timeData),
          child: Icon(
            Icons.settings,
            size: 24,
            color: provider.estaTrabalhando()
                ? Theme.of(context).primaryColor
                : Color(0xff529300),
          ),
        ),
      ],
    );
  }

  double _value(PomodoroStore store, TimeData _timeData) {
    double totalseconds =
        store.minutos.toDouble() * 60 + store.segundos.toDouble();
    double dividernumber = store.estaTrabalhando()
        ? _timeData.minutosTrabalho * 60
        : _timeData.minutosDescanso * 60;

    double value = 1 - (totalseconds / dividernumber);
    // print(store.estaTrabalhando() ? store.tempoTrabalho : store.tempoDescanso);
    // print(value);
    return value;
  }

  _modalBottomSheet(BuildContext context, PomodoroStore provider,
      PomodoroEvents _events, TimeData _timeData) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Observer(
            builder: (_) => ListTile(
              title: Text("Trabalho"),
              trailing: Text(provider.tempoTrabalho.toString() + "min"),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Observer(
                    builder: (_) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // CIRCULAR BUTTON: IncrementTimeButton1
                        CircularButton(
                          onTap: () =>
                              _events.incrementWorkEvent(provider, _timeData),
                          child: Icon(
                            Icons.add,
                            size: 24,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(provider.tempoTrabalho.toString()),
                        // CIRCULAR BUTTON: DecrementTimeButton1
                        CircularButton(
                          onTap: () =>
                              _events.decrementWorkEvent(provider, _timeData),
                          child: Icon(
                            Icons.remove,
                            size: 24,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Observer(
            builder: (_) => ListTile(
              title: Text("Descanso"),
              trailing: Text(provider.tempoDescanso.toString() + "min"),
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) => Observer(
                  builder: (_) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularButton(
                        // CIRCULAR BUTTON: IncrementTimeButton2
                        onTap: () =>
                            _events.incrementRestEvent(provider, _timeData),
                        child: Icon(
                          Icons.add,
                          size: 24,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(provider.tempoDescanso.toString()),
                      // CIRCULAR BUTTON: DecrementTimeButton2
                      CircularButton(
                        onTap: () =>
                            _events.decrementRestEvent(provider, _timeData),
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
            ),
          ),
        ],
      ),
    );
  }
}
