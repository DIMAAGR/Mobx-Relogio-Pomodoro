import 'package:mobx/mobx.dart';

part 'counter.store.g.dart'; // IMPORTAR O ARQUIVO QUE SERÁ GERADO

// Dentro desse arquivo será gerado um mixin chamado _$CounterStore
// Esse Mixin será usado para instânciar a classe que será usada

class CounterStore = _CounterStore with _$CounterStore;

// Para o Funcionamento Correto das Dependencias é necessário
// algumas adaptações.

// A CLASSE TEM QUE SER ABSTRATA
abstract class _CounterStore with Store {
  // DECORATION PARA DEFINIR QUE ELE É OBSERVADO
  @observable
  int contador = 0;

  // DECORATION PARA DEFINIR QUE ELE É UMA AÇÃO
  @action
  void increment() => contador++;

  // Esse Gerenciamento só é possivel por causa das duas Dependências
  // São Elas Build Runner e Mobx Code Gen.

}
