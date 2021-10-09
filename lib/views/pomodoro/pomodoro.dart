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
    if (provider.estaTrabalhando()) provider.reiniciar();
    provider.incrementarTempoTrabalho();
  }

  void decrementWorkEvent(PomodoroStore provider, TimeData timeData) {
    if (provider.tempoTrabalho > 1) timeData.decrementarMinutosTrabalho();
    if (provider.estaTrabalhando()) provider.reiniciar();
    if (provider.tempoTrabalho > 1) provider.decrementartempoTrabalho();
  }

  void incrementRestEvent(PomodoroStore provider, TimeData timeData) {
    timeData.incrementarMinutosDescanso();
    if (provider.estaDescansando()) provider.reiniciar();
    provider.incrementarTempoDescanso();
  }

  void decrementRestEvent(PomodoroStore provider, TimeData timeData) {
    if (provider.tempoDescanso > 1) timeData.decrementarMinutosDescanso();
    if (provider.tempoDescanso == 0) provider.incrementarTempoDescanso();
    if (provider.estaDescansando()) provider.reiniciar();
    provider.decrementartempoDescanso();
  }

  void startStopEvent(PomodoroStore provider) =>
      provider.iniciou ? provider.parar() : provider.iniciar();
}
