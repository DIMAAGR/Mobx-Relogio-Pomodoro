import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart'; // IMPORTANDO O POMODORO STORE G
// GERADO AUTOMATICAMENTE

// Cria-se a classe PomodoroStore que Recebe _PomodoroStore
// com o _$PomodoroStore que e a classe gerada Automaticamente
class PomodoroStore = _PomodoroStore with _$PomodoroStore;

// ENUM PARA TIPOS DE INTERVALO
enum TipoIntervalo { TRABALHO, DESCANSO }

// Cria-se uma Classe abstrata com(Mixin) store
abstract class _PomodoroStore with Store {
  // Haverá inicialmente duas variaveis de Tempo
  // Tempo trabalho e Tempo descanso, as duas são observaveis
  // Também tem por padrão o tempo de 1min!

  @observable
  int tempoTrabalho = 1;
  @observable
  int tempoDescanso = 1;

  // Também Haverá duas variaveis inteiras minutos e segundos
  @observable
  int minutos = 1;
  @observable
  int segundos = 0;

  // Haverá um bool que determina se foi iniciado ou não o cronometro!
  @observable
  bool iniciou = false;

  // Como o tempo muda de segundo à segundo é necessário um timer
  Timer? cronometro;

  // Defini o tipo de trabalho atual
  TipoIntervalo tipoIntervalo = TipoIntervalo.TRABALHO;

  // Ações
  @action
  void incrementarTempoTrabalho() => ++tempoTrabalho;

  @action
  void decrementartempoTrabalho() => --tempoTrabalho;

  @action
  void incrementarTempoDescanso() => ++tempoDescanso;

  @action
  void decrementartempoDescanso() =>
      tempoDescanso > 1 ? --tempoDescanso : tempoDescanso = 1;

  @action
  reiniciar() {
    parar();
    minutos = estaTrabalhando() ? tempoTrabalho : tempoDescanso;
    segundos = 0;
  }

  @action
  void iniciar() {
    iniciou = true;
    cronometro = Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (minutos == 0 && segundos == 0) {
        _trocarTipoIntervalo();
      } else if (segundos == 0) {
        segundos = 59;
        minutos--;
      } else {
        segundos--;
      }
    });
  }

  @action
  void parar() {
    iniciou = false;
    cronometro?.cancel(); // SENTENÇA DE CODIGO NULLSAFE
  }

  //FUNÇÕES PARA FACILITAR LOGICA
  bool estaTrabalhando() => tipoIntervalo == TipoIntervalo.TRABALHO;
  bool estaDescansando() => tipoIntervalo == TipoIntervalo.DESCANSO;

  void _trocarTipoIntervalo() {
    if (estaTrabalhando()) {
      tipoIntervalo = TipoIntervalo.DESCANSO;
      minutos = tempoDescanso;
    } else {
      tipoIntervalo = TipoIntervalo.TRABALHO;
      minutos = tempoTrabalho;
    }
    segundos = 0;
  }
}
