import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart'; // IMPORTANDO O POMODORO STORE G
// GERADO AUTOMATICAMENTE

// Cria-se a classe PomodoroStore que Recebe _PomodoroStore
// com o _$PomodoroStore que e a classe gerada Automaticamente
class PomodoroStore = _PomodoroStore with _$PomodoroStore;

// Cria-se uma Classe abstrata com(Mixin) store
abstract class _PomodoroStore with Store {
  // Haverá inicialmente duas variaveis de Tempo
  // Tempo trabalho e Tempo descanso, as duas são observaveis
  // Também tem por padrão o tempo de 2min!

  @observable
  int tempoTrabalho = 1;
  @observable
  int tempoDescanso = 1;

  // Ações
  @action
  void incrementarTempoTrabalho() => tempoTrabalho++;
  @action
  void decrementartempoTrabalho() => tempoTrabalho--;
  @action
  void incrementarTempoDescanso() => tempoDescanso++;
  @action
  void decrementartempoDescanso() => tempoDescanso--;
}
