import 'package:mobx_relogio_pomodoro/data/data.dart';
import 'package:mobx_relogio_pomodoro/store/pomodoro.store.dart';

class PomodoroEvents {
  // PARA MAIOR ORGANIZAÇÃO DAS AÇÕES E EVENTOS OCORRIDOS DENTRO DO APP
  // FOI CRIADA A CLASSE POMODORO EVENTS

  // TODAS AS AÇÕES PODERIAM SER FEITAS DENTRO DO pomodoro.designer.dart
  // POREM OPTEI POR COLOCA-LOS AQUI PARA MELHORAR A MINHA PROPRIA
  // COMPREENSÃO E LEGIBILIDADE DO CODIGO!

  // TAMBEM OPTEI EM FAZER ISSO COMO UM TESTE PARA VERIFICAR SE
  // SERIA MELHOR SE O CODIGO FOSSE ORGANIZADO DESSA MANEIRA.

  void incrementWorkEvent(PomodoroStore provider, TimeData timeData) {
    timeData.incrementarMinutosTrabalho();
    provider.incrementarTempoTrabalho();
  }

  void decrementWorkEvent(PomodoroStore provider, TimeData timeData) {
    provider.decrementartempoTrabalho();
    timeData.decrementarMinutosTrabalho();
  }

  void incrementRestEvent(PomodoroStore provider, TimeData timeData) {
    provider.incrementarTempoDescanso();
    timeData.incrementarMinutosDescanso();
  }

  void decrementRestEvent(PomodoroStore provider, TimeData timeData) {
    provider.decrementartempoDescanso();
    timeData.decrementarMinutosDescanso();
  }

  void startStopEvent(PomodoroStore provider) =>
      provider.iniciou ? provider.parar() : provider.iniciar();
}
