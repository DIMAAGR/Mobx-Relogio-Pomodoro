// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CounterStore on _CounterStore, Store {
  final _$contadorAtom = Atom(name: '_CounterStore.contador');

  @override
  int get contador {
    _$contadorAtom.reportRead();
    return super.contador;
  }

  @override
  set contador(int value) {
    _$contadorAtom.reportWrite(value, super.contador, () {
      super.contador = value;
    });
  }

  final _$_CounterStoreActionController =
      ActionController(name: '_CounterStore');

  @override
  void increment() {
    final _$actionInfo = _$_CounterStoreActionController.startAction(
        name: '_CounterStore.increment');
    try {
      return super.increment();
    } finally {
      _$_CounterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contador: ${contador}
    ''';
  }
}
